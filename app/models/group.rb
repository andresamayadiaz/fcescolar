class Group < ActiveRecord::Base
  belongs_to :study_plan
  has_many :group_details
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  
  accepts_nested_attributes_for :group_details, :reject_if => :all_blank, :allow_destroy => true

  validate :conflict_classroom_teacher_weekday_time_slot
  validate :overlap_time_slot

  def conflict_classroom_teacher_weekday_time_slot
    arr_group_details = self.group_details
    arr_0 = arr_group_details.map{|gd| "#{gd.classroom_id} - #{gd.teacher_id} - #{gd.weekday} - #{gd.time_slot_id}" }
    arr_1 = arr_group_details.map{|gd| "#{gd.classroom_id} - #{gd.weekday} - #{gd.time_slot_id}" }
    arr_2 = arr_group_details.map{|gd| "#{gd.teacher_id} - #{gd.weekday} - #{gd.time_slot_id}" }
    errors.add(:base, "Group is conflicted each other") unless arr_0.uniq.length==arr_0.length and arr_1.uniq.length==arr_1.length and arr_2.uniq.length==arr_2.length
  end

  def overlap_time_slot
    arr_group_details = self.group_details
    arr_time_slots = arr_group_details.map{|group_detail| group_detail.time_slot}
    arr_group_details.each do |group_detail|
      current_start_time = group_detail.time_slot.start_time
      current_end_time = group_detail.time_slot.end_time
      arr_time_slots.each do |time_slot|
        errors.add(:base, "Group is conflicted each other") if group_detail.time_slot!=time_slot and (current_start_time..current_end_time).overlaps?(time_slot.start_time..time_slot.end_time)
      end
    end
  end
  
  def self.search_by_year(status,year)
    groups = Group.where(:status=>status)
    selected_groups = []
    groups.each do |group|
      group.group_details.each do |group_detail|
        selected_groups << group if group_detail.year==year
      end
    end
    selected_groups
  end
end

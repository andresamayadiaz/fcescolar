class GroupDetail < ActiveRecord::Base
  belongs_to :group
  belongs_to :subject
  belongs_to :classroom
  belongs_to :time_slot
  belongs_to :teacher, :class_name => 'Person', :foreign_key => 'teacher_id'
  belongs_to :closer, :class_name => 'User', :foreign_key => 'closer_id'
  scope :open_by_year_and_month, ->(year,month) { where(:year => year, :month => month, :status=>'Open')}

  def self.load(year,month,study_plan_id)
    group_details = []
    groups = Group.where(:study_plan_id=>study_plan_id)
    groups.each do |group|
      group_details =  group.group_details.select{|group_detail| group_detail.status=='Open' and group_detail.year==year and group_detail.month==month}
    end
    group_details
  end

  def self.get_years
    GroupDetail.all.map(&:year).uniq
  end

  def self.get_related_weekday(study_plan_id,year,month)
    group = Group.where(:study_plan_id=>study_plan_id).try(:first)
    group.present? and group.group_details.present?  ? group.group_details.open_by_year_and_month(year,month) : []
  end

end

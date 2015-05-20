class Group < ActiveRecord::Base
  belongs_to :study_plan
  has_many :group_details

  accepts_nested_attributes_for :group_details, :reject_if => :all_blank, :allow_destroy => true

  after_create :generate_group_id

  def self.search_by_year(status,year)
    groups = Group.where(:status=>status)
    selected_groups = []
    groups.each do |group|
      group.group_details.each do |group_detail|
        byebug if group_detail.year==year
        selected_groups << group if group_detail.year==year
      end
    end
    selected_groups
  end

  def generate_group_id
    self.update(:group_id=>"#{self.start_year}-#{self.id}")
  end

  def self.get_group_id_numbers(year)
    Group.all.select{|g| g.group_id.split('-').try(:first)==year}.map{|g|g.group_id.split('-').try(:last)}.uniq
  end

  def self.get_years
    Group.all.map{|g|g.group_id.split('-').try(:first)}.uniq
  end
end

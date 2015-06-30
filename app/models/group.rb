class Group < ActiveRecord::Base
  belongs_to :study_plan
  has_many :group_details
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  
  accepts_nested_attributes_for :group_details, :reject_if => :all_blank, :allow_destroy => true

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

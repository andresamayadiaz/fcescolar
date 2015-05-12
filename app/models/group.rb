class Group < ActiveRecord::Base
  belongs_to :study_plan
  has_many :group_details

  accepts_nested_attributes_for :group_details, :reject_if => :all_blank, :allow_destroy => true
end

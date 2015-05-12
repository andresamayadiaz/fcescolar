class Group < ActiveRecord::Base
  belongs_to :study_plan
  has_many :group_details
end

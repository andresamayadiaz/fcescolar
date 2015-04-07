class StudyPlan < ActiveRecord::Base
  belongs_to :career
  belongs_to :period
  has_many :study_plan_periods
  scope :active, -> { where(status: true) } 
end

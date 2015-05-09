class StudyPlan < ActiveRecord::Base
  belongs_to :career
  belongs_to :period
  has_many :study_plan_periods
  scope :active, -> { where(status: true) } 

  accepts_nested_attributes_for :study_plan_periods, :reject_if => :all_blank, :allow_destroy => true

end

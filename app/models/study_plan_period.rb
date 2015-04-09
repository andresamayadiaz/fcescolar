class StudyPlanPeriod < ActiveRecord::Base
  belongs_to :study_plan
  has_many :study_plan_subjects
  accepts_nested_attributes_for :study_plan_subjects, :reject_if => :all_blank, :allow_destroy => true
end

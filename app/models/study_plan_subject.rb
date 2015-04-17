class StudyPlanSubject < ActiveRecord::Base
  belongs_to :study_plan_period
  belongs_to :curricular_line
  belongs_to :subject
end

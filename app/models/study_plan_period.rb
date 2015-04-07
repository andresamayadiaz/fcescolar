class StudyPlanPeriod < ActiveRecord::Base
  belongs_to :curricular_line
  belongs_to :study_plan
end

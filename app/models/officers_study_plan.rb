class OfficersStudyPlan < ActiveRecord::Base
  belongs_to :officer
  belongs_to :study_plan
end

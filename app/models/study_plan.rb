class StudyPlan < ActiveRecord::Base
  belongs_to :career
  belongs_to :period
end

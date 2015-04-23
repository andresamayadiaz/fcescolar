class TeacherDictamination < ActiveRecord::Base
  belongs_to :person
  belongs_to :study_plan
end

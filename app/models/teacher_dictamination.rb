class TeacherDictamination < ActiveRecord::Base
  belongs_to :person
  belongs_to :study_plan
  has_and_belongs_to_many :subjects
end

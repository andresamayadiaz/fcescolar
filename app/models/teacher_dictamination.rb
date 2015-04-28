class TeacherDictamination < ActiveRecord::Base
  belongs_to :person
  belongs_to :study_plan
  has_and_belongs_to_many :subjects

  def self.dictaminations_list(teacher,status)
    where(:person_id=>teacher, :status=>status)
  end

end

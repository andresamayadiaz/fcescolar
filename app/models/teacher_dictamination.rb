class TeacherDictamination < ActiveRecord::Base
  belongs_to :person
  belongs_to :study_plan
  has_and_belongs_to_many :subjects

  def self.dictaminations_list(teacher,status)
    dictaminations_list = []
    dictaminations = where(:person_id=>teacher, :status=>status)
    dictaminations.each do |d|
      subjects = Subject.get_by_study_plan(d.study_plan.id)
      subjects_list = subjects.map(&:name).join(", ") rescue ""
      dictaminations_list << {:teacher=>d.person.try(:name), :status=>d.status, :created_at=>d.created_at, :subjects=>subjects_list}
    end
    dictaminations_list
  end

end

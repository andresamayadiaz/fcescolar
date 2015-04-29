class TeacherDictamination < ActiveRecord::Base
  belongs_to :person
  belongs_to :study_plan
  has_and_belongs_to_many :subjects

  has_attached_file :evidence
  validates_attachment_content_type :evidence, content_type: ['application/pdf']

  def self.dictaminations_list(teacher,status)
    where(:person_id=>teacher, :status=>status)
  end

end

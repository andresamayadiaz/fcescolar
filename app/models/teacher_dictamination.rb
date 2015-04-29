class TeacherDictamination < ActiveRecord::Base
  belongs_to :person
  belongs_to :study_plan
  has_and_belongs_to_many :subjects
  has_many :approved_subjects

  accepts_nested_attributes_for :approved_subjects, :reject_if => :all_blank, :allow_destroy => true
  has_attached_file :evidence
  validates_attachment_content_type :evidence, content_type: ['application/pdf']

  def self.dictaminations_list(teacher_first_name,teacher_last_name,status)
    joins(:person).where('people.first_name=? and people.last_name=? and teacher_dictaminations.status=?', teacher_first_name, teacher_last_name, status)
  end

end

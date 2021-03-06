class TeacherDictamination < ActiveRecord::Base
  belongs_to :person
  belongs_to :study_plan
  
  has_and_belongs_to_many :subjects
  before_destroy { subjects.clear }
  
  has_many :approved_subjects, dependent: :destroy
  has_many :officers_teacher_dictaminations
  has_many :officers, through: :officers_teacher_dictaminations

  accepts_nested_attributes_for :approved_subjects, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :officers_teacher_dictaminations, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :evidence
  validates :evidence, :attachment_presence => true, :on => :update, if: :accept_dictamination
  validates_attachment_content_type :evidence, content_type: ['application/pdf']
  validates :subjects, presence: true

  def accept_dictamination
    self.status=='Accepted'
  end

  def self.dictaminations_list(teacher_first_name,teacher_last_name,status)
    joins(:person).where('people.first_name LIKE ? and CONCAT(people.fathers_maiden_name," ",people.mothers_maiden_name) LIKE ? and teacher_dictaminations.status=?', "%#{teacher_first_name}%", "%#{teacher_last_name}%", status)
  end

  def self.generate_teacher(subject_id)
    arr_teachers = []
    accepted_dictaminations = TeacherDictamination.where(:status=>'Accepted')
    accepted_dictaminations.each do |d|
      arr_teachers << {:id=>d.person.id, :name=>d.person.name} if d.approved_subjects.map(&:subject_id).include? subject_id
    end
    arr_teachers
  end

end

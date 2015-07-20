class Subject < ActiveRecord::Base
  resourcify
  belongs_to :study_level
  belongs_to :curricular_line
  
  has_and_belongs_to_many :careers
  before_destroy { careers.clear }
  
  scope :by_study_level_id, ->(id) { where(:study_level_id => id)}

  validates :study_level, :presence=>true
  validates :curricular_line, :presence=>true
  validates :clave, uniqueness: true

  def self.get_teacher
  end

  def self.get_selected(ids)
    selected_arr = []
    ids.split(",").each do |i|
      subject = self.find(i)
      selected_arr << {:name=>subject.try(:name),:clave=>subject.try(:clave)}
    end if ids
    selected_arr
  end

  def self.get_by_career(career_id,curricular_line_id)
    where(:curricular_line_id=>curricular_line_id).select{|s|s.careers.map(&:id).include? career_id.to_i}
  end

  def self.get_by_study_plan(study_plan_id,teacher_id)
    study_plan = StudyPlan.find(study_plan_id)
    selected_subjects = study_plan.study_plan_periods.map{|period| period.study_plan_subjects.map{|sp_subject| sp_subject.subject} }.flatten.uniq
    if teacher_id.present?
      teacher_user_id = Person.find(teacher_id).user.id
      role = Role.find_by_name('teacher')
      teacher_role = UsersRole.find_by_user_id_and_role_id(teacher_user_id,role.id)
      permitted_study_levels = teacher_role.study_levels.map(&:id)
      filtered_selected_subjects = selected_subjects.select{|subject| permitted_study_levels.include? subject.study_level_id}
    else
      filtered_selected_subjects = selected_subjects
    end
    filtered_selected_subjects 
  end
end

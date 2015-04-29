class Subject < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  belongs_to :study_level
  belongs_to :curricular_line
  has_and_belongs_to_many :careers

  scope :by_study_level_id, ->(id) { where(:study_level_id => id)}

  def self.get_selected(ids)
  	selected_arr = []
  	ids.split(",").each do |i|
  		subject = self.find(i)
  		selected_arr << {:name=>subject.try(:name),:clave=>subject.try(:clave)}
  	end if ids
  	selected_arr
  end

  def self.get_by_study_plan(study_plan_id)
    study_plan = StudyPlan.find(study_plan_id)
    study_plan.study_plan_periods.map{|period| period.study_plan_subjects.map{|sp_subject| sp_subject.subject} }.flatten
  end
end

class StudyPlanSubject < ActiveRecord::Base
  belongs_to :study_plan_period
  belongs_to :curricular_line
  belongs_to :subject
  
  def self.get_max_freq_by_study_plan(study_plan_id)
    study_plan = StudyPlan.find(study_plan_id)
    arr_freq = study_plan.study_plan_periods.map{|period| period.study_plan_subjects.map{|sp_subject| sp_subject.weekly_frequency} }.flatten
    arr_freq.max
  end

  def self.get_by_study_plan_id(study_plan_id)
    where(:study_plan_id=>study_plan_id)
  end
end

class ChangeColumnWeeklyFreqStudyPlanSubjects < ActiveRecord::Migration
  def change
  	rename_column :study_plan_subjects, :weekly_frequency, :horas_semanales
  end
end

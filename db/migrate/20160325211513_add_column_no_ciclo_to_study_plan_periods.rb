class AddColumnNoCicloToStudyPlanPeriods < ActiveRecord::Migration
  def change
    add_column :study_plan_periods, :no_ciclo, :integer
  end
end

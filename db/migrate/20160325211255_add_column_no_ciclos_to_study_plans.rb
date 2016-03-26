class AddColumnNoCiclosToStudyPlans < ActiveRecord::Migration
  def change
    add_column :study_plans, :no_ciclos, :integer
  end
end

class AddColumnsToStudyPlan < ActiveRecord::Migration
  def change
    add_column :study_plans, :anio, :integer
    add_column :study_plans, :acuerdo, :string
    add_column :study_plans, :modalidad, :string
    add_column :study_plans, :beca, :integer
    add_column :study_plans, :fecha_caducidad, :datetime
  end
end

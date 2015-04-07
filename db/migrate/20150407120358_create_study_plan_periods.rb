class CreateStudyPlanPeriods < ActiveRecord::Migration
  def change
    create_table :study_plan_periods do |t|
      t.string :period_name
      t.belongs_to :curricular_line, index: true
      t.belongs_to :study_plan, index: true
      t.timestamps
    end
  end
end

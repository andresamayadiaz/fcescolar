class CreateStudyPlanSubjects < ActiveRecord::Migration
  def change
    create_table :study_plan_subjects do |t|
      t.belongs_to :study_plan_period, index: true
      t.belongs_to :curricular_line, index: true
      t.belongs_to :subject, index: true
      t.string :name
      t.integer :weekly_frequency
      t.integer :credits

      t.timestamps
    end
  end
end

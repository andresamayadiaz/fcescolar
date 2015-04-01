class CreateStudyPlans < ActiveRecord::Migration
  def change
    create_table :study_plans do |t|
      t.belongs_to :career, index: true
      t.belongs_to :period, index: true
      t.integer :number_of_periods
      t.string :name
      t.integer :attendance_rate
      t.integer :extra_opportunities
      t.boolean :status, default: true
      t.timestamps
    end
  end
end

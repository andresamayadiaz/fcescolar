class CreateOfficersStudyPlans < ActiveRecord::Migration
  def change
    create_table :officers_study_plans do |t|
      t.belongs_to :officer, index: true
      t.belongs_to :study_plan, index: true
      t.integer :position

      t.timestamps
    end
  end
end

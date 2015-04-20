class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.belongs_to :study_plan, index: true
      t.belongs_to :campus, index: true

      t.timestamps
    end
  end
end

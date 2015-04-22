class CreateSchedulesTimeSlots < ActiveRecord::Migration
  def change
    create_table :schedules_time_slots do |t|
      t.belongs_to :time_slot, index: true
      t.belongs_to :schedule, index: true
    end
  end
end

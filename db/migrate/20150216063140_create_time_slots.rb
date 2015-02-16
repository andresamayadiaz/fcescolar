class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.belongs_to :franchise, index: true
      t.belongs_to :campus, index:true
      t.string :name
      t.time :start_time
      t.time :end_time
      t.boolean :status

      t.timestamps
    end
  end
end

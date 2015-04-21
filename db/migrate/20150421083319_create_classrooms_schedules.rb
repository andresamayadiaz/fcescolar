class CreateClassroomsSchedules < ActiveRecord::Migration
  def change
    create_table :classrooms_schedules do |t|
      t.belongs_to :classroom, index: true
      t.belongs_to :schedule, index: true
    end
  end
end

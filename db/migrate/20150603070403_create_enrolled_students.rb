class CreateEnrolledStudents < ActiveRecord::Migration
  def change
    create_table :enrolled_students do |t|
      t.belongs_to :group_detail, index: true
      t.belongs_to :person, index: true
      t.string :status

      t.timestamps
    end
  end
end

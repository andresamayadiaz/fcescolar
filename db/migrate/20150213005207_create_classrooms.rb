class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.belongs_to :franchise, index: true
      t.belongs_to :campus, index: true
      t.string :name
      t.integer :max_capacity
      t.integer :consecutive
      t.boolean :status

      t.timestamps
    end
  end
end

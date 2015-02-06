class CreateCampuses < ActiveRecord::Migration
  def change
    create_table :campuses do |t|
      t.string :name
      t.text :address
      t.integer :classrooms
      t.belongs_to :franchise, index: true

      t.timestamps
    end
  end
end

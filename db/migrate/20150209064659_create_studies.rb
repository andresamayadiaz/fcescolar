class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :name
      t.boolean :status
      t.belongs_to :franchise, index: true

      t.timestamps
    end
  end
end

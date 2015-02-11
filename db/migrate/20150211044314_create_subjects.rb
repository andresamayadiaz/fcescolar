class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.belongs_to :franchise, index: true
      t.string :name
      t.belongs_to :study_level, index: true
      t.belongs_to :curricular_line, index: true
      t.string :clave
      t.boolean :status

      t.timestamps
    end
  end
end

class CreateStudyLevels < ActiveRecord::Migration
  def change
    create_table :study_levels do |t|
      t.belongs_to :franchise, index: true
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end

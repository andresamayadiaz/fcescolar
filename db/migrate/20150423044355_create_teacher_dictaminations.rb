class CreateTeacherDictaminations < ActiveRecord::Migration
  def change
    create_table :teacher_dictaminations do |t|
      t.belongs_to :person, index: true
      t.belongs_to :study_plan, index: true
      t.string :witness_1
      t.string :witness_2

      t.timestamps
    end
  end
end

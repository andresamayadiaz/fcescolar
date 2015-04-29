class CreateSubjectsTeacherDictaminations < ActiveRecord::Migration
  def change
    create_table :subjects_teacher_dictaminations do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :teacher_dictamination
    end
    add_index :subjects_teacher_dictaminations, :teacher_dictamination_id, name: 'teacher_dict_id'
  end
end

class CreateApprovedSubjects < ActiveRecord::Migration
  def change
    create_table :approved_subjects do |t|
      t.belongs_to :teacher_dictamination
      t.belongs_to :subject, index: true

      t.timestamps
    end
    add_index :approved_subjects, :teacher_dictamination_id, name: 'teacher_dict_id'
  end
end

class CreateOfficersTeacherDictaminations < ActiveRecord::Migration
	def change
		create_table :officers_teacher_dictaminations do |t|
			t.belongs_to :officer, index: true
			t.belongs_to :teacher_dictamination
			t.integer :rank
			t.timestamps
		end
		add_index :officers_teacher_dictaminations, :teacher_dictamination_id, name: 'teacher_dict_id'
	end
end

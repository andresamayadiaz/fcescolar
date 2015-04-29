class AddStatusToTeacherDictaminations < ActiveRecord::Migration
  def change
    add_column :teacher_dictaminations, :status, :string,  default: 'Pending'
  end
end

class AddTeacherIdToGroupDetails < ActiveRecord::Migration
  def change
    add_column :group_details, :teacher_id, :integer
  end
end

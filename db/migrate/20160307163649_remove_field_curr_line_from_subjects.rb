class RemoveFieldCurrLineFromSubjects < ActiveRecord::Migration
  def change
    remove_column :subjects, :curricular_line_id, :integer
  end
end

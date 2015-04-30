class RenameClassroomsToNumberOfClassroomsOnCampuses < ActiveRecord::Migration
  def change
    rename_column :campuses, :classrooms, :number_of_classrooms
  end
end

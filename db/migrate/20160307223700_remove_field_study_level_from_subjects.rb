class RemoveFieldStudyLevelFromSubjects < ActiveRecord::Migration
  def change
  	remove_column :subjects, :study_level_id, :integer
  end
end

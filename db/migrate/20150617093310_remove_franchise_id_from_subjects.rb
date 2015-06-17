class RemoveFranchiseIdFromSubjects < ActiveRecord::Migration
  def change
    remove_column :subjects, :franchise_id
  end
end

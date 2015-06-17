class RemoveFranchiseIdFromCareers < ActiveRecord::Migration
  def change
    remove_column :careers, :franchise_id
  end
end

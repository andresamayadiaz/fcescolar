class UpdateRelationPersonUserFranchise < ActiveRecord::Migration
  def change
  	remove_column :users, :franchise_id, :integer
  	add_column :people, :franchise_id, :integer
  end
end

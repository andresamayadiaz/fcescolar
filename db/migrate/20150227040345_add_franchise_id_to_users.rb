class AddFranchiseIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :franchise_id, :integer
  end
end

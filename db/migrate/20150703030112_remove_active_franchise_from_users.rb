class RemoveActiveFranchiseFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :active_franchise, :integer
  end
end

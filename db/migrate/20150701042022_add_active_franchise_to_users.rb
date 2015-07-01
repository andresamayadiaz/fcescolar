class AddActiveFranchiseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_franchise, :integer
  end
end

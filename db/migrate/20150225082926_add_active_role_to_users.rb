class AddActiveRoleToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :active_role, :string
  end
end

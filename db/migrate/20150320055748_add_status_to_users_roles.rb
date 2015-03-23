class AddStatusToUsersRoles < ActiveRecord::Migration
  def change
    add_column :users_roles, :status, :boolean, :default=>true
  end
end

class AddStatusToRoles < ActiveRecord::Migration
  def change
  	add_column :roles, :status, :boolean, :default=>true
  end
end

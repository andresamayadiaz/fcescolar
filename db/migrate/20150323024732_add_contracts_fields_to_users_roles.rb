class AddContractsFieldsToUsersRoles < ActiveRecord::Migration
  def change
  	add_column :users_roles, :contract, :string, :null => false
  	add_column :users_roles, :contract_sign_date, :date, :null => false
  	add_column :users_roles, :date_of_receipt, :date, :null => false
  end
end

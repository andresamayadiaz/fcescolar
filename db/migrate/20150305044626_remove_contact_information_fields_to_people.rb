class RemoveContactInformationFieldsToPeople < ActiveRecord::Migration
  def change
  	remove_column :people, :contact_street, :string
  	remove_column :people, :contact_num_ext, :string
  	remove_column :people, :contact_num_int, :string
  	remove_column :people, :contact_colonia, :string
  	remove_column :people, :contact_cp, :string
  	remove_column :people, :contact_municipio, :string
  	remove_column :people, :contact_state_id, :integer
  	remove_column :people, :contact_country_id, :integer
  	remove_column :people, :contact_phone_emergency, :string
  end
end

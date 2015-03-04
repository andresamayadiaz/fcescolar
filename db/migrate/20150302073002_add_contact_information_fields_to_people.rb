class AddContactInformationFieldsToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :contact_street, :string
  	add_column :people, :contact_num_ext, :string
  	add_column :people, :contact_num_int, :string
  	add_column :people, :contact_colonia, :string
  	add_column :people, :contact_cp, :string
  	add_column :people, :contact_municipio, :string
  	add_column :people, :contact_state, :integer
  	add_column :people, :contact_country, :integer
  	add_column :people, :contact_phone_emergency, :string
  end
end

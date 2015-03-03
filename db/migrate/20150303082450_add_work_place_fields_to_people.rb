class AddWorkPlaceFieldsToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :empresa, :string
  	add_column :people, :puesto, :string
  	add_column :people, :calle, :string
  	add_column :people, :municipio, :string
  	add_column :people, :work_num_ext, :string
  	add_column :people, :work_num_int, :string
  	add_column :people, :work_colonia, :integer
  	add_column :people, :work_cp, :integer
  	add_column :people, :work_state_id, :integer
  	add_column :people, :work_country_id, :integer
  end
end

class RemoveWorkPlaceFieldsToPeople < ActiveRecord::Migration
  def change
  	remove_column :people, :empresa, :string
  	remove_column :people, :puesto, :string
  	remove_column :people, :calle, :string
  	remove_column :people, :municipio, :string
  	remove_column :people, :work_num_ext, :string
  	remove_column :people, :work_num_int, :string
  	remove_column :people, :work_colonia, :integer
  	remove_column :people, :work_cp, :integer
  	remove_column :people, :work_state_id, :integer
  	remove_column :people, :work_country_id, :integer
  end
end

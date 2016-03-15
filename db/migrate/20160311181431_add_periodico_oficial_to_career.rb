class AddPeriodicoOficialToCareer < ActiveRecord::Migration
  def change
	add_column :careers, :po_file_file_name, :string
	add_column :careers, :po_file_content_type, :string
	add_column :careers, :po_file_file_size, :integer
	add_column :careers, :po_file_updated_at, :datetime
  end
end

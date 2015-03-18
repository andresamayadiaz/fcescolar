class AddCampusIdToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :campus_id, :integer
  end
end

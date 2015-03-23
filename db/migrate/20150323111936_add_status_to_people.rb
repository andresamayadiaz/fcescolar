class AddStatusToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :status, :boolean, :default=>true
  end
end

class AddStatusToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :status, :string, :null => false, :default => 'Open'
  end
end

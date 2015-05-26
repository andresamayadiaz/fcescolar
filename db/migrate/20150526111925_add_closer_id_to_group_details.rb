class AddCloserIdToGroupDetails < ActiveRecord::Migration
  def change
    add_column :group_details, :closer_id, :integer
  end
end

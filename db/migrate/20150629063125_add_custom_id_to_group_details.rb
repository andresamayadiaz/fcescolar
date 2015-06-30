class AddCustomIdToGroupDetails < ActiveRecord::Migration
  def change
    add_column :group_details, :custom_group_id, :string
  end
end

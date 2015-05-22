class AddStatusToGroupDetails < ActiveRecord::Migration
  def change
    add_column :group_details, :status, :string
  end
end

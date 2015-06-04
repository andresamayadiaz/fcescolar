class AddClosedAtToGroupDetails < ActiveRecord::Migration
  def change
    add_column :group_details, :closed_at, :date
  end
end

class RemoveGroupIdFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :group_id
  end
end

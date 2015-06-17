class AddNameToOfficers < ActiveRecord::Migration
  def change
    add_column :officers, :name, :string
  end
end

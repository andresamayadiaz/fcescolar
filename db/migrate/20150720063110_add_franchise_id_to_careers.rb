class AddFranchiseIdToCareers < ActiveRecord::Migration
  def change
    add_column :careers, :franchise_id, :integer
  end
end

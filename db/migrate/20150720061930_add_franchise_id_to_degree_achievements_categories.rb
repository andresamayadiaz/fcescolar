class AddFranchiseIdToDegreeAchievementsCategories < ActiveRecord::Migration
  def change
    add_column :degree_achievements_categories, :franchise_id, :integer
  end
end

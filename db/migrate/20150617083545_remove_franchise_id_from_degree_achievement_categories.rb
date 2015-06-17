class RemoveFranchiseIdFromDegreeAchievementCategories < ActiveRecord::Migration
  def change
    remove_column :degree_achievements_categories, :franchise_id
  end
end

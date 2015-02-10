class CreateDegreeAchievementsCategories < ActiveRecord::Migration
  def change
    create_table :degree_achievements_categories do |t|
      t.belongs_to :franchise, index: true
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end

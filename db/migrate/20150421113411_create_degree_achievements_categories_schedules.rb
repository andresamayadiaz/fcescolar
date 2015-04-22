class CreateDegreeAchievementsCategoriesSchedules < ActiveRecord::Migration
  def change
    create_table :degree_achievements_categories_schedules do |t|
      t.belongs_to :degree_achievements_category
      t.belongs_to :schedule, index: true
    end
    add_index :degree_achievements_categories_schedules, :degree_achievements_category_id, name: 'degree_category_id'
  end
end

class CreateTableStudyLevelsUsersRoles < ActiveRecord::Migration
  def change
    create_table :study_levels_users_roles do |t|
      t.belongs_to :study_level, index: true
      t.belongs_to :users_role, index: true
    end
  end
end

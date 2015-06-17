class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers do |t|
      t.string :title
      t.string :last_name
      t.string :position
      t.string :dependency_level_1
      t.string :dependency_level_2
      t.string :dependency_level_3
      t.string :dependency_level_4
      t.string :dependency_level_5

      t.timestamps
    end
  end
end

class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.belongs_to :study_plan, index: true
      t.string :start_year
      t.string :start_month

      t.timestamps
    end
  end
end

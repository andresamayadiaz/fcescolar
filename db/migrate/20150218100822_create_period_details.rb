class CreatePeriodDetails < ActiveRecord::Migration
  def change
    create_table :period_details do |t|
      t.belongs_to :period, index: true
      t.date :initial_month
      t.date :end_month
      t.date :year

      t.timestamps
    end
  end
end

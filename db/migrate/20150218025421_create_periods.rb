class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.belongs_to :franchise, index: true
      t.date :initial_month
      t.integer :month_length
      t.integer :number_of_blocks
      t.date :start_year
      t.string :name

      t.timestamps
    end
  end
end

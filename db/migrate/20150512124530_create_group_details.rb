class CreateGroupDetails < ActiveRecord::Migration
  def change
    create_table :group_details do |t|
      t.belongs_to :group, index: true
      t.string :year
      t.string :month
      t.belongs_to :subject, index: true
      t.string :weekday
      t.belongs_to :classroom, index: true
      t.belongs_to :time_slot, index: true

      t.timestamps
    end
  end
end

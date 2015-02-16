class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :franchise, index: true
      t.belongs_to :user, index: true
      t.string :title
      t.text :message
      t.string :destination_role

      t.timestamps
    end
  end
end

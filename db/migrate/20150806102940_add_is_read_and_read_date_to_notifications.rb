class AddIsReadAndReadDateToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :is_read, :boolean, default: false
    add_column :notifications, :read_date, :date
  end
end

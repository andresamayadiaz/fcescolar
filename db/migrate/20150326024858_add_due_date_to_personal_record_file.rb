class AddDueDateToPersonalRecordFile < ActiveRecord::Migration
  def change
    add_column :personal_record_files, :due_date, :date
  end
end

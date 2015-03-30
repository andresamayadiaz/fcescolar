class AddIsResponsiveLetterToPersonalRecordFiles < ActiveRecord::Migration
  def change
    add_column :personal_record_files, :is_responsive_letter, :boolean
  end
end

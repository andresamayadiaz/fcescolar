class AddHasBeenMatchedToPersonalRecordFiles < ActiveRecord::Migration
  def change
  	add_column :personal_record_files, :has_been_matched, :boolean
  end
end

class AddMotiveToPersonalRecordFiles < ActiveRecord::Migration
  def change
  	add_column :personal_record_files, :motive, :text
  end
end

class AddDocToPersonalRecordFiles < ActiveRecord::Migration
  def change
  	 add_attachment :personal_record_files, :document
  end
end

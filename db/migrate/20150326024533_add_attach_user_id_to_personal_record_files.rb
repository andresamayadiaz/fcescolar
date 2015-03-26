class AddAttachUserIdToPersonalRecordFiles < ActiveRecord::Migration
  def change
  	add_column :personal_record_files, :attach_user_id, :integer
  end
end

class AddBackgroundOfficialDocIdToPersonalRecordFiles < ActiveRecord::Migration
  def change
  	add_column :personal_record_files, :background_official_doc_id, :integer
  end
end

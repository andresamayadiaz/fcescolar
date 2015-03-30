class AddDocumentTypeToPersonalRecordFiles < ActiveRecord::Migration
  def change
  	add_column :personal_record_files, :document_type, :string
  end
end

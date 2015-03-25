class CreatePersonalRecordFiles < ActiveRecord::Migration
  def change
    create_table :personal_record_files do |t|
      t.belongs_to :person, index: true
      t.timestamps
    end
  end
end

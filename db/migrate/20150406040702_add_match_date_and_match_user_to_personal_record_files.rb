class AddMatchDateAndMatchUserToPersonalRecordFiles < ActiveRecord::Migration
  def change
	add_column :personal_record_files, :match_date, :date
	add_column :personal_record_files, :match_user_id, :integer
  end
end

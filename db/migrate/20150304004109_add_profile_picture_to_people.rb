class AddProfilePictureToPeople < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.attachment :profile_picture
    end
  end

  def self.down
    remove_attachment :people, :profile_picture
  end
end

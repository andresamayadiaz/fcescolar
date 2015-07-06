class Notification < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  belongs_to :user
  belongs_to :role

  validates :franchise, :presence => true
  validates :user, :presence => true

  def self.get_all_matched(role_id)
    where('role_id=? OR role_id IS NULL', role_id).order('created_at desc')
  end
end

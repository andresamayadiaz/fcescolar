class Notification < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  belongs_to :user
  belongs_to :role

  validates :franchise, :presence => true
  validates :user, :presence => true
  validates :role, :presence => true
end

class Notification < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  belongs_to :user
end

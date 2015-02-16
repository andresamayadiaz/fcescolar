class Notification < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :user
end

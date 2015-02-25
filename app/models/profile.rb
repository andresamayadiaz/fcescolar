class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  belongs_to :state
end

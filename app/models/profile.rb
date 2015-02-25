class Profile < ActiveRecord::Base
	resourcify

	belongs_to :user
	belongs_to :country
	belongs_to :state
end

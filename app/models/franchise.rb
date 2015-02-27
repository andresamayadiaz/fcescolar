class Franchise < ActiveRecord::Base
	resourcify
	has_many :users
end

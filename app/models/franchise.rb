class Franchise < ActiveRecord::Base
	resourcify
	has_many :people
	has_many :campuses
end

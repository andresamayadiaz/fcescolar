class Franchise < ActiveRecord::Base
	resourcify
	has_many :people
	has_many :campuses
  has_many :degree_achievements_categories
end

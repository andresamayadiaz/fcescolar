class Franchise < ActiveRecord::Base
	resourcify
	has_many :people, dependent: :destroy
	has_many :campuses, dependent: :destroy
  has_many :degree_achievements_categories, dependent: :destroy
  has_many :careers, dependent: :destroy
end

class Franchise < ActiveRecord::Base
	resourcify
	has_many :people, dependent: :destroy
	has_many :campuses, dependent: :destroy
  has_many :degree_achievements_categories, dependent: :destroy
  has_many :careers, dependent: :destroy
  
  def self.get_id(name)
    franchise = find_by_name(name)
    return franchise.id
  end

end

class Country < ActiveRecord::Base
	resourcify
	has_many :states, dependent: :destroy

  def self.get_id(name)
    country = find_by_name(name)
    return country.id
  end
end

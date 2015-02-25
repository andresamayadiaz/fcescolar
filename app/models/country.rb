class Country < ActiveRecord::Base
	resourcify
	has_many :states
end

class Country < ActiveRecord::Base
	resourcify
	has_many :states, dependent: :destroy
end

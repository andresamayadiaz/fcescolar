class State < ActiveRecord::Base
  resourcify
  belongs_to :country
end

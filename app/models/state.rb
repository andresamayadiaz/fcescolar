class State < ActiveRecord::Base
  resourcify
  belongs_to :country
  validates :country, :presence => true
  validates :name, :presence => true
end

class Officer < ActiveRecord::Base
  validates :title, :name, :last_name, :position, :presence => true
end

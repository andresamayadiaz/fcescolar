class Campus < ActiveRecord::Base
  resourcify
  belongs_to :franchise
end

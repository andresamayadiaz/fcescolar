class RelationshipType < ActiveRecord::Base
  resourcify
  
  belongs_to :franchise
end

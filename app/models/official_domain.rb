class OfficialDomain < ActiveRecord::Base
  resourcify
  belongs_to :franchise
end

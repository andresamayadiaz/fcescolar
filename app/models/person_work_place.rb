class PersonWorkPlace < ActiveRecord::Base
  audited
  belongs_to :state
  belongs_to :country
  belongs_to :person
end

class PersonLivingAddress < ActiveRecord::Base
  audited
  belongs_to :state
  belongs_to :country
  belongs_to :person

  validates :street, :num_ext, :colonia, :cp, :municipio, :state_id, :country_id, :phone_emergency, :presence => true
end

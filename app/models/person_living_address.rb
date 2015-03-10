class PersonLivingAddress < ActiveRecord::Base
  audited
  belongs_to :state
  belongs_to :country
  belongs_to :person

  has_many :person_emails
  has_many :contact_telephones

  validates :street, :num_int, :num_ext, :colonia, :cp, :municipio, :state_id, :country_id, :phone_emergency, :presence => true
end

class PersonLivingAddress < ActiveRecord::Base
  audited
  belongs_to :state
  belongs_to :country
  belongs_to :person

  has_many :person_emails
  has_many :contact_telephones
end

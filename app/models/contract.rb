class Contract < ActiveRecord::Base
  belongs_to :contracts_template
  belongs_to :person
  validates :contracts_template, :presence => true
end

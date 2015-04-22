class ContractsTemplate < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  scope :active, -> { where(status: true) }
end

class UsersRole < ActiveRecord::Base
	belongs_to :user
	belongs_to :role

	scope :active, -> { where(status: true) }

	validates :contract, :contract_sign_date, :date_of_receipt, :presence=>true
end

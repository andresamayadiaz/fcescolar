class UsersRole < ActiveRecord::Base
	belongs_to :user
	belongs_to :role

	scope :active, -> { where(status: true) }

	validates :contract, :contract_sign_date, :date_of_receipt, :presence=>true

  def self.get_latest_added_students
    students = []
    students_role = UsersRole.joins(:role).where('roles.name="student" and status=true')
    students_role.each do |sr|
      students << sr.user.person
    end
    students
  end
end

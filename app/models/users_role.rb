class UsersRole < ActiveRecord::Base
	belongs_to :user
	belongs_to :role

	scope :active, -> { where(status: true) }

	validates :contract, :contract_sign_date, :date_of_receipt, :presence=>true

  def self.get_latest_added_students
    students = []
    latest_added_people = Person.all.limit(10);
    latest_added_people.each do |p|
      students << p if p.user.users_roles.map{|users_role| users_role.role.name.include? 'student'}
    end
    students.sort_by(&:id)
  end
end

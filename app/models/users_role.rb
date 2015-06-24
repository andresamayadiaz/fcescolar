class UsersRole < ActiveRecord::Base
	belongs_to :user
	belongs_to :role

  has_and_belongs_to_many :study_levels
	scope :active, -> { where(status: true) }

	validates :contract, :contract_sign_date, :date_of_receipt, :presence=>true

  accepts_nested_attributes_for :study_levels, :reject_if => :all_blank, :allow_destroy => true

  def self.get_latest_added_students
    students = []
    latest_added_people = Person.all.limit(10);
    latest_added_people.each do |p|
      students << p if p.user.users_roles.map{|users_role| users_role.role.name}.include? 'student'
    end
    students.sort_by(&:id)
  end
end

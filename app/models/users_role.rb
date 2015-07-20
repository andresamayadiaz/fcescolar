class UsersRole < ActiveRecord::Base
	belongs_to :user
	belongs_to :role

  has_and_belongs_to_many :study_levels
  before_destroy { study_levels.clear }
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

  def self.active_teacher
    users_roles = UsersRole.active
    teachers = []
    users_roles.each do |ur|
      teachers << ur.user.person if ur.role.name=='teacher' if ur.user.person.status
    end
    teachers
  end
end

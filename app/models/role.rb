class Role < ActiveRecord::Base
  has_many :users_roles
  has_many :users, through: :users_roles
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  def self.get_unassigned(user, logged_in_user_role)
    restrict_to_assign = []
    case logged_in_user_role
    when "franchise_director"
      restrict_to_assign = ['super_administrator']
    when "finance"
      restrict_to_assign = ['super_administrator','franchise_director']
    when "academic_coordinator"
      restrict_to_assign = ['super_administrator','franchise_director','finance']
    when "head_of_school_control"
      restrict_to_assign = ['super_administrator','franchise_director','finance','academic_coordinator']
    end

  	all_roles = Role.all
  	assigned_roles = user.roles
  	(all_roles - assigned_roles).reject! {|r| restrict_to_assign.include? r.name }
  end
end

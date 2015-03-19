class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  def self.get_unassigned(user)
  	all_roles = Role.all
  	assigned_roles = user.roles
  	all_roles - assigned_roles
  end
end

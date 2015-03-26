class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    case user.active_role
    when 'super_administrator'
        can :manage, :all
    when 'franchise_director'
        can [:create, :read, :update, :search, :assign_roles, :add_new_role, :block_or_unblock, :manage_personal_record_file, :update_country_and_state], Person
    when 'finance'
        can [:create, :read, :update, :assign_roles, :add_new_role], Person
    when 'academic_coordinator'
        can [:read, :assign_roles, :search, :add_new_role, :block_or_unblock, :manage_personal_record_file, :update_country_and_state], Person
    when 'head_of_school_control'
        can [:create, :read, :update], Notification, :user_id=>user.id
        can [:create, :read, :search, :assign_roles, :add_new_role, :block_or_unblock, :manage_personal_record_file, :update_country_and_state], Person
    when 'teacher'
        can [:search], Person
    when 'support_executive'
        can [:search, :manage_personal_record_file, :update_country_and_state], Person
    when 'salesman'
        can [:search], Person
    end
    #inni
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

  end
end

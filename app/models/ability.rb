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
        can :manage, StudyPlan
        can [:check_for_study_plan], Career
        can [:update_password], User, :id=>user.id
        can [:create, :read, :update, :search, :assign_roles, :add_new_role, :block_or_unblock, :manage_personal_record_file, :update_country_and_state, :auth_to_sign_responsive_letter, :profile, :download_personal_record_file, :matching_date_and_user, :new_contract, :generate_contract, :new_teacher_dictamination, :create_teacher_dictamination, :get_active_subjects_by_study_plan_id, :accept_reject_dictamination, :reject_dictamination, :accept_dictamination, :download_evidence, :new_group, :load_group_preferences, :generate_full_groups, :generate_single_group, :search_group, :get_group_id_number, :search_group_by_group_id, :search_group_by_year, :view_group, :get_period_of_year_for_search_group, :copy_new_group], Person
        can [:block_it, :close_it, :open_it, :unblock_it, :new_enroll_student, :get_years_of_selected_study_plan, :get_months_of_selected_year, :get_week_day_of_selected_month, :load_latest_added_students, :search_student, :load, :create_enroll_student, :global_unsubscribe, :load_subscription, :create_global_unsubscribe], Group
    when 'finance'
        can [:update_password], User, :id=>user.id
        can [:create, :read, :update, :assign_roles, :add_new_role, :profile, :download_personal_record_file, :matching_date_and_user, :new_contract, :generate_contract, :search_group, :get_group_id_number, :search_group_by_group_id, :search_group_by_year, :view_group, :get_period_of_year_for_search_group], Person
        can [:close_it, :open_it], Group
    when 'academic_coordinator'
        can [:enable, :create_schedule, :get_active_classrooms_by_campus_id, :get_active_time_slots_by_campus_id, :get_period_years_by_study_plan_id, :get_period_months_by_period_detail_id], StudyPlan
        can [:update_password], User, :id=>user.id
        can [:read, :assign_roles, :search, :add_new_role, :block_or_unblock, :manage_personal_record_file, :update_country_and_state, :auth_to_sign_responsive_letter, :profile, :download_personal_record_file, :matching_date_and_user, :new_contract, :generate_contract, :new_teacher_dictamination, :create_teacher_dictamination, :get_active_subjects_by_study_plan_id, :accept_reject_dictamination, :reject_dictamination, :accept_dictamination, :download_evidence, :new_group, :load_group_preferences, :generate_full_groups, :generate_single_group, :search_group, :get_group_id_number, :search_group_by_group_id, :search_group_by_year, :view_group, :get_period_of_year_for_search_group, :copy_new_group], Person
        can [:close_it, :open_it, :new_enroll_student, :get_years_of_selected_study_plan, :get_months_of_selected_year, :get_week_day_of_selected_month, :load_latest_added_students, :search_student, :load, :create_enroll_student], Group
    when 'head_of_school_control'
        can [:update_password], User, :id=>user.id
        can [:create, :read, :update], Notification, :user_id=>user.id
        can [:get_period_years_by_study_plan_id, :get_period_months_by_period_detail_id], StudyPlan
        can [:create, :read, :search, :assign_roles, :add_new_role, :block_or_unblock, :manage_personal_record_file, :update_country_and_state, :auth_to_sign_responsive_letter, :profile, :download_personal_record_file, :matching_date_and_user, :new_contract, :generate_contract, :new_teacher_dictamination, :create_teacher_dictamination, :get_active_subjects_by_study_plan_id, :accept_reject_dictamination, :reject_dictamination, :accept_dictamination, :download_evidence, :new_group, :load_group_preferences, :generate_full_groups, :generate_single_group, :search_group, :get_group_id_number, :search_group_by_group_id, :search_group_by_year, :view_group, :get_period_of_year_for_search_group, :copy_new_group], Person
        can [:close_it, :open_it, :new_enroll_student, :get_years_of_selected_study_plan, :get_months_of_selected_year, :get_week_day_of_selected_month, :load_latest_added_students, :search_student, :load, :create_enroll_student, :global_unsubscribe, :load_subscription, :create_global_unsubscribe], Group
    when 'teacher'
        can [:update_password], User, :id=>user.id
        can [:search, :profile, :download_personal_record_file, :matching_date_and_user, :search_group, :get_group_id_number, :search_group_by_group_id, :search_group_by_year, :view_group, :get_period_of_year_for_search_group], Person
        can [:close_it, :open_it], Group
    when 'support_executive'
        can [:update_password], User, :id=>user.id
        can [:search, :manage_personal_record_file, :update_country_and_state, :profile, :download_personal_record_file, :matching_date_and_user], Person
        can [:close_it, :open_it], Group
    when 'salesman'
        can [:update_password], User, :id=>user.id
        can [:search, :profile, :download_personal_record_file, :matching_date_and_user], Person
        can [:close_it, :open_it], Group
    when 'student'
        can [:update_password], User, :id=>user.id
        can [:profile, :download_personal_record_file], Person
    end
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

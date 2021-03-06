class VisitorsController < ApplicationController
	#authorize_resource :class => false

	def index
		if current_user.users_roles.active.present? and current_user.person.status
			current_user.update_attribute(:active_role, current_user.users_roles.active.first.role.name) if current_user.users_roles.active.present? and current_user.users_roles.active.length==1
			if current_user.active_role.present?
				role_id = Role.where(:name=>current_user.active_role).try(:first).id
				if current_user.active_role=='super_administrator' and session[:active_franchise].present?
					@notifications = Notification.get_all_matched(role_id, session[:active_franchise].to_i)
				else
					@notifications = Notification.get_all_matched(role_id, current_user.person.franchise_id)
				end
			end
			@enabled_roles = current_user.users_roles.active
		else
			sign_out current_user
			redirect_to root_url
		end
	end

	def search
		@people = Person.main_search(params)
		@subjects = Subject.where("name LIKE ?", "%#{params[:q]}%")
		@group_details = GroupDetail.where(:custom_group_id=>params[:q])
	end
end

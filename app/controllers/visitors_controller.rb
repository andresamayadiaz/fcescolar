class VisitorsController < ApplicationController
	def index
		current_user.update_attribute(:active_role, current_user.users_roles.active.first.role.name) if current_user.users_roles.active.present? and current_user.users_roles.active.length==1
		if current_user.active_role.present?
			role_id = Role.where(:name=>current_user.active_role).try(:first).id
			@notifications = Notification.where(:role_id=>role_id).order('created_at desc')
		end
		@enabled_roles = current_user.users_roles.active
	end
end

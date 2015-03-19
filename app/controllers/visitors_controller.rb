class VisitorsController < ApplicationController
	def index
		current_user.update_attribute(:active_role, current_user.roles.first.name) if current_user.roles.present? and current_user.roles.length==1
		if current_user.active_role.present?
			role_id = Role.where(:name=>current_user.active_role).try(:first).id
			@notifications = Notification.where(:role_id=>role_id).order('created_at desc')
		end
	end
end

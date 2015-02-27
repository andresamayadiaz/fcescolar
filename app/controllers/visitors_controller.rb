class VisitorsController < ApplicationController
	def index
		if current_user.active_role.present?
			role_id = Role.where(:name=>current_user.active_role).try(:first).id
			@notifications = Notification.where(:role_id=>role_id)
		end
	end
end

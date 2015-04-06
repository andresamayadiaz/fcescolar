class NotificationMailer < ActionMailer::Base
	default from: "from@example.com"

	def match_notification_email(user,validator,doc)
		@user = user
		@validator = validator
		@subject = doc.has_been_matched ? "Document is OK" : "Document is Not OK"
		@content = doc.has_been_matched ? "Attached document #{doc.document_file_name} is validated successfully" : "Attached document #{doc.document_file_name} validation failed"	
		mail(to: [@user.email,@validator.email], subject: @subject)
	end
end

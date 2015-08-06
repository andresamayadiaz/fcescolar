class NotificationMailer < ActionMailer::Base
	default from: "from@example.com"

	def match_notification_email(user,validator,doc)
		@user = user
		@validator = validator
		@subject = doc.has_been_matched ? "Document is OK" : "Document is Not OK"
		@content = doc.has_been_matched ? "Attached document #{doc.document_file_name} is validated successfully" : "Attached document #{doc.document_file_name} validation failed"	
		mail(to: [@user.email,@validator.email], subject: @subject)
	end

  def password_changes(user)
    @user = user
    @subject = 'Your Password has been Changed'
		mail(to: @user.email, subject: @subject)
  end

  def notify_responsive_letter(user, responsive_letter)
    @user = user
    @responsive_letter = responsive_letter
    @subject = "Expired Responsive Letter: #{@responsive_letter.document_file_name}"
    mail(to: @user.email, subject: @subject)
  end

  def notify_contract_end(user, contract)
    @user = user
    @contract = contract
    @subject = "Contract end soon: #{@contract.contracts_template.name} for #{@contract.person.name}"
    mail(to: @user.email, subject: @subject)
  end

end

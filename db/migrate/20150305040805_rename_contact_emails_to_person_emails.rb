class RenameContactEmailsToPersonEmails < ActiveRecord::Migration
  def change
  	rename_table :contact_emails, :person_emails
  end
end

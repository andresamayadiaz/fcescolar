class CreateContactEmails < ActiveRecord::Migration
  def change
    create_table :contact_emails do |t|
      t.belongs_to :person, index: true
      t.string :email

      t.timestamps
    end
  end
end

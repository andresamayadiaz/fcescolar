class CreateContactTelephones < ActiveRecord::Migration
  def change
    create_table :contact_telephones do |t|
      t.belongs_to :person, index: true
      t.string :phone_number
      t.string :phone_type

      t.timestamps
    end
  end
end

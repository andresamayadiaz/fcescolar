class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string :last_academic_degree
      t.belongs_to :country, index: true
      t.belongs_to :state, index: true
      t.string :street
      t.string :external
      t.string :internal
      t.string :colonia
      t.string :cp
      t.string :city
      t.string :emergency_phone
      t.string :additional_email_1
      t.string :additional_email_2
      t.string :phones_1
      t.string :phone_type_1
      t.string :phones_2
      t.string :phone_type_2

      t.timestamps
    end
  end
end

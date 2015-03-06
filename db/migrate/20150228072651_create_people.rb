class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :curp
      t.string :rfc
      t.string :email
      t.string :name
      t.string :fathers_maiden_name
      t.string :mothers_maiden_name
      t.belongs_to :country, index: true
      t.belongs_to :state, index: true
      t.date :birthday

      t.timestamps
    end
  end
end

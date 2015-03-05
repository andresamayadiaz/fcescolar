class CreatePersonLivingAddresses < ActiveRecord::Migration
  def change
    create_table :person_living_addresses do |t|
      t.string :street
      t.string :num_ext
      t.string :num_int
      t.string :colonia
      t.string :cp
      t.string :municipio
      t.belongs_to :state, index: true
      t.belongs_to :country, index: true
      t.string :phone_emergency
      t.belongs_to :person, index: true
      t.timestamps
    end
  end
end

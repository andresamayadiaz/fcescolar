class CreatePersonWorkPlaces < ActiveRecord::Migration
  def change
    create_table :person_work_places do |t|
      t.string :empresa
      t.string :puesto
      t.string :calle
      t.string :municipio
      t.string :num_ext
      t.string :num_int
      t.string :colonia
      t.integer :cp
      t.belongs_to :state, index: true
      t.belongs_to :country, index: true
      t.belongs_to :person, index: true
      t.timestamps
    end
  end
end

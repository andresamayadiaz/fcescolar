class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.belongs_to :contracts_template, index: true
      t.belongs_to :person, index: true
      t.timestamps
    end
  end
end

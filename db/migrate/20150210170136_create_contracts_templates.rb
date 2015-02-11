class CreateContractsTemplates < ActiveRecord::Migration
  def change
    create_table :contracts_templates do |t|
      t.belongs_to :franchise, index: true
      t.string :name
      t.text :content
      t.string :serie
      t.integer :consecutive_init
      t.integer :consecutive_next
      t.boolean :status

      t.timestamps
    end
  end
end

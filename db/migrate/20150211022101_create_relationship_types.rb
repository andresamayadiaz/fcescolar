class CreateRelationshipTypes < ActiveRecord::Migration
  def change
    create_table :relationship_types do |t|
      t.belongs_to :franchise, index: true
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end

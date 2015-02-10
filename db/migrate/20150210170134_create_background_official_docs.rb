class CreateBackgroundOfficialDocs < ActiveRecord::Migration
  def change
    create_table :background_official_docs do |t|
      t.belongs_to :franchise, index: true
      t.string :name
      t.text :responsive_letter
      t.integer :responsive_due_days
      t.boolean :status

      t.timestamps
    end
  end
end

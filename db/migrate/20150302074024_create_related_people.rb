class CreateRelatedPeople < ActiveRecord::Migration
  def change
    create_table :related_people do |t|
      t.belongs_to :person, index: true
      t.string :full_name

      t.timestamps
    end
  end
end

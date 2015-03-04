class AddRelationNameToRelatedPeople < ActiveRecord::Migration
  def change
  	add_column :related_people, :relation_name, :string
  end
end

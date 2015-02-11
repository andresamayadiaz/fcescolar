class AddIndexNameToSubjects < ActiveRecord::Migration
  def change
    add_index :subjects, :name
  end
end

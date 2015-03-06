class ReviseFieldsOnPeople < ActiveRecord::Migration
  def change
  	rename_column :people, :contact_state, :contact_state_id
  	rename_column :people, :contact_country, :contact_country_id
  end
end

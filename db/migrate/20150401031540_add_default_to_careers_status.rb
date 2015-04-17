class AddDefaultToCareersStatus < ActiveRecord::Migration
  def change
    change_column :careers, :status, :boolean, :default => true
  end
end

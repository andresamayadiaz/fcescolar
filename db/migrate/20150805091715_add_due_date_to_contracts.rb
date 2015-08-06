class AddDueDateToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :due_date, :date
  end
end

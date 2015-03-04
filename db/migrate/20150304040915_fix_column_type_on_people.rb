class FixColumnTypeOnPeople < ActiveRecord::Migration
   def up
    change_column :people, :work_colonia, :string
    change_column :people, :work_cp, :string
  end

  def down
    change_column :people, :work_colonia, :integer
    change_column :people, :work_cp, :integer
  end
end

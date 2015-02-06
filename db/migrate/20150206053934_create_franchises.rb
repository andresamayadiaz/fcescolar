class CreateFranchises < ActiveRecord::Migration
  def change
    create_table :franchises do |t|
      t.string :name
      t.string :clave_dgp
      t.text :address

      t.timestamps
    end
  end
end

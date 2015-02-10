class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.belongs_to :franchise, index: true
      t.string :name
      t.boolean :status
      t.string :rvoe
      t.belongs_to :study_level, index: true
      t.string :serie
      t.string :clave_estadistica
      t.string :clave_dgp

      t.timestamps
    end
  end
end

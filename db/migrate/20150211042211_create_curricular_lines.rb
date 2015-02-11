class CreateCurricularLines < ActiveRecord::Migration
  def change
    create_table :curricular_lines do |t|
      t.belongs_to :franchise, index: true
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end

class AddLastAcademicDegreeToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :last_academic_degree, :string
  end
end

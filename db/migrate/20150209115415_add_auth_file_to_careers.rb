class AddAuthFileToCareers < ActiveRecord::Migration
  def change
  	add_attachment :careers, :auth_file
  end
end

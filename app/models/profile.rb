class Profile < ActiveRecord::Base
	resourcify

	belongs_to :user
	belongs_to :country
	belongs_to :state

	has_attached_file :avatar, 
		:styles => { :medium => "300x300>", :thumb => "150x150>" }, 
		:default_url => "150x150.gif"
  	
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

class Person < ActiveRecord::Base
  belongs_to :country
  belongs_to :state

  has_one :user

  after_create :create_user

  def create_user
  	new_user = User.new(:email=>self.email,:password=>'changeme',:password_confirmation=>'changeme')
  	new_user.skip_confirmation!
  	new_user.save!
  	self.update_attribute(:user,new_user)
  end
end

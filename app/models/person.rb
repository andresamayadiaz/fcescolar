class Person < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  belongs_to :contact_state, :class_name => 'State', :foreign_key => 'contact_state_id'
  belongs_to :contact_country, :class_name => 'Country', :foreign_key => 'contact_country_id'
  belongs_to :work_state, :class_name => 'State', :foreign_key => 'work_state_id'
  belongs_to :work_country, :class_name => 'Country', :foreign_key => 'work_country_id'

  has_one :user
  has_many :related_people
  accepts_nested_attributes_for :related_people, :reject_if => :all_blank, :allow_destroy => true

  after_create :create_user

  def create_user
  	new_user = User.new(:email=>self.email,:password=>'changeme',:password_confirmation=>'changeme')
  	new_user.skip_confirmation!
  	new_user.save!
  	self.update_attribute(:user,new_user)
  end
end

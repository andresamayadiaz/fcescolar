class Person < ActiveRecord::Base
  belongs_to :country
  belongs_to :state

  has_one :person_living_address
  has_one :person_work_place
  has_one :user
  has_many :related_people
  has_many :person_emails
  has_many :contact_telephones
  
  accepts_nested_attributes_for :person_living_address, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :person_work_place, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :related_people, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :person_emails, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :contact_telephones, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :profile_picture, :styles => {:thumb => "100x100>" }, :default_url => "100x100.png"
    
  validates_attachment :profile_picture, :content_type => { :content_type => "image/jpeg" }
  validates :person_living_address, :presence => true

  after_create :create_user if User.all.length>0

  def create_user
  	new_user = User.new(:email=>self.email,:password=>'changeme',:password_confirmation=>'changeme')
  	new_user.skip_confirmation!
  	new_user.save!
  	self.update_attribute(:user,new_user)
  end

  def self.search(params)
    if params[:fathers_maiden_name].present?
      fathers_maiden_name = '%' + params[:fathers_maiden_name] + '%'
    else
      fathers_maiden_name = nil
    end
    if params[:mothers_maiden_name].present?
      mothers_maiden_name = '%' + params[:mothers_maiden_name] + '%'
    else
      mothers_maiden_name = nil
    end
    if params[:name].present?
      name = '%' + params[:name] + '%'
    else
      name = nil
    end
    Person.where('fathers_maiden_name LIKE ? OR mothers_maiden_name LIKE ? OR name LIKE ?',fathers_maiden_name,mothers_maiden_name,name)
  end
end

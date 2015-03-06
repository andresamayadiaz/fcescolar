class User < ActiveRecord::Base
  audited
  resourcify
  rolify
  #enum role: [:user, :vip, :admin]
  #after_initialize :set_default_role, :if => :new_record?
  has_one :profile
  belongs_to :franchise
  belongs_to :person

  #def set_default_role
  #  self.role ||= :user
  #end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end

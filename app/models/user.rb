class User < ActiveRecord::Base
  audited
  resourcify
  rolify
  #enum role: [:user, :vip, :admin]
  #after_initialize :set_default_role, :if => :new_record?
  belongs_to :person

  has_many :users_roles, dependent: :destroy
  has_many :roles, through: :users_roles, dependent: :destroy

  #def set_default_role
  #  self.role ||= :user
  #end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :active_franchise

  validates :active_franchise, :presence => true, :if => "active_role.present? and active_role=='super_administrator'"
end

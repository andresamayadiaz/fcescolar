class Career < ActiveRecord::Base
  resourcify
  belongs_to :franchise
  belongs_to :study_level
  has_many :study_plans
  has_and_belongs_to_many :subjects

  has_attached_file :auth_file
  
  validates_attachment_content_type :auth_file, content_type: ['application/pdf']
  validates :auth_file, :attachment_presence => true
  validates :franchise, presence: true
  validates :study_level,  presence: true
end

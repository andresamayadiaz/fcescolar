class Career < ActiveRecord::Base
  resourcify
  belongs_to :study_level
  belongs_to :franchise

  has_many :study_plans, dependent: :destroy
  
  has_and_belongs_to_many :subjects
  before_destroy { subjects.clear }
  
  has_attached_file :auth_file
  
  validates_attachment_content_type :auth_file, content_type: ['application/pdf']
  validates :auth_file, :attachment_presence => true
  validates :study_level,  presence: true
end

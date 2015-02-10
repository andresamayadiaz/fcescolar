class Career < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :study_level

  has_attached_file :auth_file
  validates_attachment_content_type :auth_file, content_type: ['application/pdf']
  validates :auth_file, :attachment_presence => true
end

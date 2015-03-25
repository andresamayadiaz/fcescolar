class PersonalRecordFile < ActiveRecord::Base
  belongs_to :person

  has_attached_file :document
  validates_attachment_content_type :document, content_type: ['application/pdf']
  validates :document, :attachment_presence => true
  validates :document_type, :presence => true
end

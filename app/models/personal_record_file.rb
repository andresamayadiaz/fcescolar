class PersonalRecordFile < ActiveRecord::Base
  belongs_to :person

  has_attached_file :document
  validates_attachment_content_type :document, content_type: ['application/pdf']
  validates :document, :attachment_presence => true
  validates :document_type, :presence => true

  before_create :rename_document

  def rename_document
  	self.document_file_name = "#{self.document_type} #{self.person_id}"
  end
end

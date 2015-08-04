class PersonalRecordFile < ActiveRecord::Base
  belongs_to :person
  belongs_to :background_official_doc
  belongs_to :attach_user, :class_name => "User", :foreign_key => "attach_user_id"
  belongs_to :match_user, :class_name => "User", :foreign_key => "match_user_id"

  has_attached_file :document
  validates_attachment_content_type :document, content_type: ['application/pdf']
  #validates :document, :attachment_presence => true
  validates :background_official_doc, :presence => true

  before_create :rename_document_and_set_due_date

  scope :with_attach_user, -> { where('attach_user_id IS NOT NULL') }

  def rename_document_and_set_due_date
  	self.document_file_name = "#{self.background_official_doc.name} #{self.person_id}.pdf"
    self.due_date = Date.today + self.background_official_doc.responsive_due_days.to_i.day if self.is_responsive_letter
  end
end

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

  def self.responsive_letter_with_due_date_yesterday_or_less
    responsive_letters = PersonalRecordFile.where('is_responsive_letter = 1 and (due_date = ? or due_date < ?)', Date.today-1.days, Date.today-1.days)
    if responsive_letters.present?
      responsive_letters.each do |rl|
        NotificationMailer.notify_responsive_letter(rl.person.user,rl).deliver
      end
    end
  end

  def rename_document_and_set_due_date
  	self.document_file_name = "#{self.background_official_doc.name} #{self.person_id}.pdf"
    self.due_date = Date.today + self.background_official_doc.responsive_due_days.to_i.day if self.is_responsive_letter
  end
end

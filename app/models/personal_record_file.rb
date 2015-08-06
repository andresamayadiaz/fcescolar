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
        
        users_with_head_of_school_control_role = []
        users_with_franchise = rl.person.franchise.people.map(&:user) rescue []
        
        users_with_franchise.each do |u|
          users_with_head_of_school_control_role << u if u.users_roles.map{|ur| ur.role.name=='head_of_school_control'}
        end if users_with_franchise.present? and users_with_franchise.length>0
     
        users_with_head_of_school_control_role.each do |u|
          NotificationMailer.notify_responsive_letter(u,rl).deliver
        end if users_with_head_of_school_control_role.present? and users_with_head_of_school_control_role.length>0

      end
    end
  end

  def rename_document_and_set_due_date
  	self.document_file_name = "#{self.background_official_doc.name} #{self.person_id}.pdf"
    self.due_date = Date.today + self.background_official_doc.responsive_due_days.to_i.day if self.is_responsive_letter
  end
end

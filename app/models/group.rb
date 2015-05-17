class Group < ActiveRecord::Base
  belongs_to :study_plan
  has_many :group_details

  accepts_nested_attributes_for :group_details, :reject_if => :all_blank, :allow_destroy => true

  after_create :generate_group_id

  def generate_group_id
    self.update(:group_id=>"#{self.start_year} - #{self.id}")
  end
end

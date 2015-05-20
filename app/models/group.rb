class Group < ActiveRecord::Base
  belongs_to :study_plan
  has_many :group_details

  accepts_nested_attributes_for :group_details, :reject_if => :all_blank, :allow_destroy => true

  after_create :generate_group_id

  def generate_group_id
    self.update(:group_id=>"#{self.start_year}-#{self.id}")
  end

  def self.get_group_id_numbers(year)
    Group.all.select{|g| g.group_id.split('-').try(:first)==year}.map{|g|g.group_id.split('-').try(:last)}.uniq
  end

  def self.get_years
    Group.all.map{|g|g.group_id.split('-').try(:first)}.uniq
  end
end

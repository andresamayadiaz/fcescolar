class GroupDetail < ActiveRecord::Base
  belongs_to :group
  belongs_to :subject
  belongs_to :classroom
  belongs_to :time_slot
  belongs_to :teacher, :class_name => 'Person', :foreign_key => 'teacher_id'
  belongs_to :closer, :class_name => 'User', :foreign_key => 'closer_id'

  def self.get_years
    GroupDetail.all.map(&:year).uniq
  end

end

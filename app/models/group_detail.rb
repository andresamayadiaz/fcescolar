class GroupDetail < ActiveRecord::Base
  belongs_to :group
  belongs_to :subject
  belongs_to :classroom
  belongs_to :time_slot
end

class EnrolledStudent < ActiveRecord::Base
  belongs_to :group_detail
  belongs_to :person
end

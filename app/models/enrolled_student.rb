class EnrolledStudent < ActiveRecord::Base
  belongs_to :group_detail
  belongs_to :person

  def self.add(param)
    param.each do |k,v|
      new_enrolled_student = EnrolledStudent.new(v)
      new_enrolled_student.save
    end
  end

end

class EnrolledStudent < ActiveRecord::Base
  belongs_to :group_detail
  belongs_to :person

  def self.add(param)
    param.each do |k,v|
      new_enrolled_student = EnrolledStudent.new(v)
      new_enrolled_student.save
    end
  end

  def self.load_subscription(person_id)
    students = []
    enrolled_students = where(:person_id=>person_id)
    enrolled_students.each do |s|
      if students.select {|student| student[:career]==s.group_detail.group.study_plan.career.try(:name) }.length==0
        student_hash = {}
        student_hash[:study_plan] = s.group_detail.group.study_plan.try(:name)
        student_hash[:career_id] = s.group_detail.group.study_plan.try(:career_id)
        student_hash[:period] = s.group_detail.group.study_plan.number_of_periods
        student_hash[:career] = s.group_detail.group.study_plan.career.try(:name)
        students << student_hash
      end
    end
    students
  end

  def self.load_group_subscription(person_id)
    students = []
    enrolled_students = where(:person_id=>person_id)
    enrolled_students.each do |s|
        student_hash = {}
        student_hash[:group_id] = s.group_detail.group.group_id
        student_hash[:year] = s.group_detail.year
        student_hash[:month] = s.group_detail.month
        student_hash[:subject] = s.group_detail.subject.try(:name)
        student_hash[:weekday] = s.group_detail.weekday
        student_hash[:classroom] = s.group_detail.classroom.try(:name)
        student_hash[:time_slot] = s.group_detail.time_slot.try(:name)
        student_hash[:enrolled_student_id] = s.id
        students << student_hash
    end
    students
  end

end

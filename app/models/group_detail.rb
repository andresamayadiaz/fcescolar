class GroupDetail < ActiveRecord::Base
  belongs_to :group
  belongs_to :subject
  belongs_to :classroom
  belongs_to :time_slot
  belongs_to :teacher, :class_name => 'Person', :foreign_key => 'teacher_id'
  belongs_to :closer, :class_name => 'User', :foreign_key => 'closer_id'
  has_many :enrolled_students
  scope :open_by_year_and_month, ->(year,month) { where(:year => year, :month => month, :status=>'Open')}

  def self.load(year,month,study_plan_id,weekday,student_ids)
    selected_group_details = Array.new
    required_docs = Schedule.find_by_study_plan_id(study_plan_id).background_official_docs.map(&:id)
    groups = Group.where(:study_plan_id=>study_plan_id)
    student_ids.each do |id|
      group_details_hash = {}
      person = Person.find(id)
      loaded_files = person.personal_record_files
      if (required_docs-loaded_files.map{|f|f.background_official_doc.id}).empty?
        if loaded_files.map(&:is_responsive_letter).include? true
          group_details_hash[:color]='orange'
        else
          group_details_hash[:color]='green'
        end
      else
        #one or more docs are missing
        group_details_hash[:color]='red'
      end
      groups.each do |group|
        group_details =  group.group_details.select{|group_detail| group_detail.status=='Open' and group_detail.year==year and group_detail.month==month and group_detail.weekday==weekday}
        group_details.each do |group_detail|
          group_details_hash[:id]=group_detail.id
          group_details_hash[:group_id]=group_detail.group.group_id
          group_details_hash[:year]=group_detail.year
          group_details_hash[:month]=group_detail.month
          group_details_hash[:subject]=group_detail.subject.try(:name)
          group_details_hash[:weekday]=group_detail.weekday
          group_details_hash[:classroom]=group_detail.classroom.name
          group_details_hash[:time_slot]=group_detail.time_slot.name
          group_details_hash[:person_id]=person.id
        end if group_details.present?
      end
      selected_group_details << group_details_hash
    end
    selected_group_details
  end

  def self.get_years
    GroupDetail.all.map(&:year).uniq
  end

  def self.get_related_weekday(study_plan_id,year,month)
    arr = []
    groups = Group.where(:study_plan_id=>study_plan_id)
    groups.each do |group|
      if group.present? and group.group_details.present?
        selected_group_details = group.group_details.open_by_year_and_month(year,month)
        arr += selected_group_details if selected_group_details.present?
      end
    end
    arr.uniq { |a| a.weekday }
  end

end

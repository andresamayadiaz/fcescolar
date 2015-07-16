require 'csv'
class Person < ActiveRecord::Base
  attr_accessor :role

  belongs_to :country
  belongs_to :state
  belongs_to :franchise
  belongs_to :campus

  has_one :person_living_address
  has_one :person_work_place
  has_one :user
  has_many :related_people
  has_many :person_emails
  has_many :contact_telephones
  has_many :personal_record_files
  has_many :contracts

  accepts_nested_attributes_for :person_living_address, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :person_work_place, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :related_people, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :person_emails, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :contact_telephones, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :profile_picture, :styles => {:thumb => "100x100>" }, :default_url => "/missing.jpg"

  validates_attachment :profile_picture, :content_type => { :content_type => "image/jpeg" }
  validates :person_living_address, :presence => true
  validates :name, :presence => true
  validates :email, uniqueness: true

  after_create :create_user

  scope :active, -> { where(status: true) }

  def self.filter(params)
    franchise_id = params[:franchise_id].present? ? params[:franchise_id] : nil
    campus_id = params[:campus_id].present? ? params[:campus_id] : nil
    fathers_maiden_name = params[:fathers_maiden_name].present? ? '%' + params[:fathers_maiden_name] + '%' : nil
    mothers_maiden_name = params[:mothers_maiden_name].present? ? '%' + params[:mothers_maiden_name] + '%' : nil
    name =  params[:first_name].present? ? '%' + params[:first_name] + '%' : nil
    roles = params[:role].reject(&:empty?)
    if roles.empty?
      people = where('(franchise_id = ? AND campus_id = ?) OR (first_name LIKE ? OR fathers_maiden_name LIKE ? OR mothers_maiden_name LIKE ?)',franchise_id, campus_id, name, fathers_maiden_name, mothers_maiden_name)
    else
      people = joins(:user=>:users_roles).where('(franchise_id = ? AND campus_id = ? AND  users_roles.role_id IN (?)) OR (first_name LIKE ? OR fathers_maiden_name LIKE ? OR mothers_maiden_name LIKE ?)',franchise_id, campus_id, roles, name, fathers_maiden_name, mothers_maiden_name)
    end
    people.uniq
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["ID", "CURP", "RFC", "Email", "First Name", "Father's Maiden Name", "Mother's Maiden Name", "Country", "State", "Birthday", "Last Academic Degree", "Franchise", "Campus", "Status"]
      all.each do |person|
        csv << [
          person.id,
          person.curp,
          person.rfc,
          person.email,
          person.first_name,
          person.fathers_maiden_name,
          person.mothers_maiden_name,
          person.country.name,
          person.state.name,
          person.birthday,
          person.last_academic_degree,
          person.franchise.name,
          person.campus.name,
          person.status
        ]
      end
    end
  end

  def self.generate_single_group(study_plan_id, period_detail_id, current_user, subject_id)
    actual_campus = current_user.person.try(:campus)
    study_plan_periods = StudyPlanPeriod.where(:study_plan_id=>study_plan_id)
    period_detail = PeriodDetail.find(period_detail_id)
    next_period_details = PeriodDetail.where('id > ? and period_id = ?',period_detail_id, period_detail.period.id)
    single_group = []
    selected_subjects = []

    study_plan_periods.each_with_index do |period,index|
      sp_period = {:period_name=>period.period_name, :rows=>[]}
      period.study_plan_subjects.each{|study_plan_subject| selected_subjects << study_plan_subject if study_plan_subject.subject_id==subject_id.to_i }
      selected_subjects.each do |sp_subject|
        period_detail = next_period_details[index-1] if index>0

        if sp_period.present? and period_detail.nil? and index>0
          period_detail = PeriodDetail.find(period_detail_id).period.period_details[index-1]
        end

        if single_group.present? and period_detail.year.strftime('%Y') < single_group.last[:rows].last[:year]
          group_year = (single_group.last[:rows].last[:end_month]+single_group.last[:rows].last[:interval].month).strftime('%Y')
        else
          group_year = period_detail.year.strftime('%Y')
        end

        if sp_subject.weekly_frequency>1
          sp_subject.weekly_frequency.times do
            sp_period[:rows] <<  {
              :year=>group_year, 
              :end_month=>period_detail.end_month,
              :interval=>(period_detail.end_month.year * 12 + period_detail.end_month.month) - (period_detail.initial_month.year * 12 + period_detail.initial_month.month),
              :months=>"#{period_detail.initial_month.strftime('%b')} - #{period_detail.end_month.strftime('%b')}", 
              :subject=>sp_subject.subject.name,
                :subject_id=>sp_subject.subject.id,
                :teacher=>TeacherDictamination.generate_teacher(sp_subject.subject.id),
                :weekday=>[
                  {:id=>'Monday', :name=>'Lunes'},
                  {:id=>'Tuesday', :name=>'Martes'},
                  {:id=>'Wednesday', :name=>'Miércoles'},
                  {:id=>'Thursday', :name=>'Jueves'},
                  {:id=>'Friday', :name=>'Viernes'},
                  {:id=>'Saturday', :name=>'Sábado'},
                  {:id=>'Sunday', :name=>'Domingo'}
                ],
                :classroom=> Classroom.generate_id_and_name(actual_campus, study_plan_id),
                :timeslot=> TimeSlot.generate_id_and_name(actual_campus, study_plan_id)
            } if period_detail.present?
          end
        else
          sp_period[:rows] <<  {
            :year=>group_year, 
            :end_month=>period_detail.end_month,
            :interval=>(period_detail.end_month.year * 12 + period_detail.end_month.month) - (period_detail.initial_month.year * 12 + period_detail.initial_month.month),
            :months=>"#{period_detail.initial_month.strftime('%b')} - #{period_detail.end_month.strftime('%b')}", 
            :subject=>sp_subject.subject.name,
              :subject_id=>sp_subject.subject.id,
              :teacher=>TeacherDictamination.generate_teacher(sp_subject.subject.id),
              :weekday=>[
                {:id=>'Monday', :name=>'Lunes'},
                {:id=>'Tuesday', :name=>'Martes'},
                {:id=>'Wednesday', :name=>'Miércoles'},
                {:id=>'Thursday', :name=>'Jueves'},
                {:id=>'Friday', :name=>'Viernes'},
                {:id=>'Saturday', :name=>'Sábado'},
                {:id=>'Sunday', :name=>'Domingo'}
              ],
              :classroom=> Classroom.generate_id_and_name(actual_campus, study_plan_id),
              :timeslot=> TimeSlot.generate_id_and_name(actual_campus, study_plan_id)
          } if period_detail.present?
        end
      end
      single_group << sp_period if sp_period[:rows].present? and sp_period[:rows].length>0
    end
    single_group
  end

  def self.generate_full_groups(study_plan_id, period_detail_id, current_user)
    actual_campus = current_user.person.try(:campus)
    study_plan_periods = StudyPlanPeriod.where(:study_plan_id=>study_plan_id)
    period_detail = PeriodDetail.find(period_detail_id)
    next_period_details = PeriodDetail.where('id > ? and period_id = ?',period_detail_id, period_detail.period.id)
    full_groups = []

    study_plan_periods.each_with_index do |period,index|
      sp_period = {:period_name=>period.period_name, :rows=>[]}
      period.study_plan_subjects.each do |sp_subject|
        period_detail = next_period_details[index-1] if index>0

        if sp_period.present? and period_detail.nil? and index>0
          period_detail = PeriodDetail.find(period_detail_id).period.period_details[index-1]
        end

        if full_groups.present? and period_detail.year.strftime('%Y') < full_groups.last[:rows].last[:year]
          group_year = (full_groups.last[:rows].last[:end_month]+full_groups.last[:rows].last[:interval].month).strftime('%Y')
        else
          group_year = period_detail.year.strftime('%Y')
        end

        if sp_subject.weekly_frequency>1
          sp_subject.weekly_frequency.times do
            sp_period[:rows] <<  {
              :year=>group_year, 
              :end_month=>period_detail.end_month,
              :interval=>(period_detail.end_month.year * 12 + period_detail.end_month.month) - (period_detail.initial_month.year * 12 + period_detail.initial_month.month),
              :months=>"#{period_detail.initial_month.strftime('%b')} - #{period_detail.end_month.strftime('%b')}", 
              :subject=>sp_subject.subject.name,
                :subject_id=>sp_subject.subject.id,
                :teacher=>TeacherDictamination.generate_teacher(sp_subject.subject.id),
                :weekday=>[
                  {:id=>'Monday', :name=>'Lunes'},
                  {:id=>'Tuesday', :name=>'Martes'},
                  {:id=>'Wednesday', :name=>'Miércoles'},
                  {:id=>'Thursday', :name=>'Jueves'},
                  {:id=>'Friday', :name=>'Viernes'},
                  {:id=>'Saturday', :name=>'Sábado'},
                  {:id=>'Sunday', :name=>'Domingo'}
                ],
                :classroom=> Classroom.generate_id_and_name(actual_campus,study_plan_id),
                :timeslot=> TimeSlot.generate_id_and_name(actual_campus, study_plan_id)
            } if period_detail.present?
          end
        else
          sp_period[:rows] <<  {
            :year=>group_year, 
            :end_month=>period_detail.end_month,
            :interval=>(period_detail.end_month.year * 12 + period_detail.end_month.month) - (period_detail.initial_month.year * 12 + period_detail.initial_month.month),
            :months=>"#{period_detail.initial_month.strftime('%b')} - #{period_detail.end_month.strftime('%b')}", 
            :subject=>sp_subject.subject.name,
              :subject_id=>sp_subject.subject.id,
              :teacher=>TeacherDictamination.generate_teacher(sp_subject.subject.id),
              :weekday=>[
                {:id=>'Monday', :name=>'Lunes'},
                {:id=>'Tuesday', :name=>'Martes'},
                {:id=>'Wednesday', :name=>'Miércoles'},
                {:id=>'Thursday', :name=>'Jueves'},
                {:id=>'Friday', :name=>'Viernes'},
                {:id=>'Saturday', :name=>'Sábado'},
                {:id=>'Sunday', :name=>'Domingo'}
              ],
              :classroom=> Classroom.generate_id_and_name(actual_campus, study_plan_id),
              :timeslot=> TimeSlot.generate_id_and_name(actual_campus, study_plan_id)
          } if period_detail.present?
        end
      end
      full_groups << sp_period if sp_period[:rows].present? and sp_period[:rows].length>0
    end
    full_groups
  end 

  def create_user
    new_user = User.new(:email=>self.email,:password=>'changeme',:password_confirmation=>'changeme')
    new_user.skip_confirmation_notification!
    new_user.save!
    self.update_attribute(:user,new_user)
  end

  def self.search_student(params)
    if params[:fathers_maiden_name].present?
      fathers_maiden_name = '%' + params[:fathers_maiden_name] + '%'
    end
    if params[:mothers_maiden_name].present?
      mothers_maiden_name = '%' + params[:mothers_maiden_name] + '%'
    end
    if params[:name].present?
      name = '%' + params[:name] + '%'
    end
    if params[:student_id].present?
      student_id = params[:student_id]
    end
    people = Person.where('fathers_maiden_name LIKE ? OR mothers_maiden_name LIKE ? OR first_name LIKE ? OR id = ?',fathers_maiden_name,mothers_maiden_name,name,student_id)
    students = people.select{|p| p.user.users_roles.present? and p.user.users_roles.map{|users_role| users_role.role.name}.include? 'student' } 
    students
  end

  def self.search(params, user)
    if params[:fathers_maiden_name].present?
      fathers_maiden_name = '%' + params[:fathers_maiden_name] + '%'
    else
      fathers_maiden_name = nil
    end
    if params[:mothers_maiden_name].present?
      mothers_maiden_name = '%' + params[:mothers_maiden_name] + '%'
    else
      mothers_maiden_name = nil
    end
    if params[:name].present?
      name = '%' + params[:name] + '%'
    else
      name = nil
    end
    if params[:campus].present?
      campus_id = params[:campus].to_i
      Person.where('(fathers_maiden_name LIKE ? OR mothers_maiden_name LIKE ? OR first_name LIKE ?) AND campus_id = ?',fathers_maiden_name,mothers_maiden_name,name, campus_id)
    else
      selected_campus_id = user.person.franchise.campuses.map(&:id)
      Person.where('(fathers_maiden_name LIKE ? OR mothers_maiden_name LIKE ? OR first_name LIKE ?) AND campus_id IN (?)',fathers_maiden_name,mothers_maiden_name,name, selected_campus_id)
    end
  end

  def self.search_by_name(params)
    if params[:name].present? 
      name = '%' + params[:name] + '%'
    else
      name = nil
    end
    Person.where('name LIKE ?', name)
  end

  def full_name
  end 

  def name
    "#{self.first_name} #{last_name}"
  end

  def last_name
    "#{self.fathers_maiden_name} #{self.mothers_maiden_name}"
  end

  def full_name2
  end
end

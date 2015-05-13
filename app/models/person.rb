class Person < ActiveRecord::Base
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
  
  accepts_nested_attributes_for :person_living_address, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :person_work_place, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :related_people, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :person_emails, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :contact_telephones, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :profile_picture, :styles => {:thumb => "100x100>" }, :default_url => "/missing.jpg"
    
  validates_attachment :profile_picture, :content_type => { :content_type => "image/jpeg" }
  validates :person_living_address, :presence => true
  validates :name, :presence => true
  #validates :franchise, :presence => true, :if => lambda { self.user.active_role!='super_administrator' }

  after_create :create_user
  
  scope :active, -> { where(status: true) }
  
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
        sp_period[:rows] <<  {
          :year=>period_detail.year.strftime('%Y'), 
          :months=>"#{period_detail.initial_month.strftime('%b')} - #{period_detail.end_month.strftime('%b')}", 
          :subject=>sp_subject.subject.name,
          :subject_id=>sp_subject.subject.id,
          :teacher=>[{:id=>1, :name=>'Andres Nombre Nombres'}],
          :weekday=>[
            {:id=>'Monday', :name=>'Lunes'},
            {:id=>'Tuesday', :name=>'Martes'},
            {:id=>'Wednesday', :name=>'Miércoles'},
            {:id=>'Thursday', :name=>'Jueves'},
            {:id=>'Friday', :name=>'Viernes'},
            {:id=>'Saturday', :name=>'Sábado'},
            {:id=>'Sunday', :name=>'Domingo'}
          ],
          :classroom=> Classroom.generate_id_and_name(actual_campus),
          :timeslot=> TimeSlot.generate_id_and_name(actual_campus)
        } if period_detail.present?
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
      Person.where('(fathers_maiden_name LIKE ? OR mothers_maiden_name LIKE ? OR name LIKE ?) AND campus_id = ?',fathers_maiden_name,mothers_maiden_name,name, campus_id)
    else
      selected_campus_id = user.person.franchise.campuses.map(&:id)
      Person.where('(fathers_maiden_name LIKE ? OR mothers_maiden_name LIKE ? OR name LIKE ?) AND campus_id IN (?)',fathers_maiden_name,mothers_maiden_name,name, selected_campus_id)
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

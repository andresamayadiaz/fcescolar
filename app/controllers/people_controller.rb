class PeopleController < ApplicationController
  load_and_authorize_resource
  before_action :set_person, only: [:show, :edit, :update, :destroy, :profile, :block_or_unblock]
  autocomplete :person, :name, :full => true

  respond_to :html

  def get_active_subjects_by_study_plan_id
    @active_subjects = Subject.get_by_study_plan(params[:study_plan_id])
    render :json => @active_subjects
  end

  def new_teacher_dictamination
    @teacher_dictamination = TeacherDictamination.new
    @active_teachers = Person.active.select{|p| p.user.roles.map(&:name).include? 'teacher' }
    @active_study_plans = StudyPlan.active
  end

  def create_teacher_dictamination
    teacher_dictamination = TeacherDictamination.new(params[:teacher_dictamination])
    if teacher_dictamination.save
      flash[:notice]='Teacher dictamination is created'
    else
      flash[:error]='Failed to create teacher dictamination'
    end
    redirect_to :back
  end

  def new_contract
    @person = Person.find(params[:id]) rescue nil
    if @person.present?
      @new_contract = Contract.new(:person_id=>@person.id)
      @active_contracts_templates = ContractsTemplate.active
    end
  end

  def preview_contract
    new_contract = Contract.new(params[:contract])
    template = new_contract.contracts_template
    @pdf_content = "#{ContractsTemplate.replace_keywords(template.content,new_contract.person,new_contract.person.franchise)}".html_safe
    prefix_content = "#{template.serie}#{template.consecutive_next}".html_safe
    render  :pdf => template.name,
            :header => {
              :content => prefix_content
            },
            :footer => {
              :content => prefix_content
            }
  end

  def generate_contract
    new_contract = Contract.new(params[:contract])
    if new_contract.save
      template = new_contract.contracts_template
      if template.consecutive_next.nil?
        template.update(:consecutive_next=>template.consecutive_init)
      else
        template.update(:consecutive_next=>template.consecutive_next+1)
      end
      @pdf_content = "#{ContractsTemplate.replace_keywords(template.content,new_contract.person,new_contract.person.franchise)}".html_safe
      prefix_content = "#{template.serie}#{template.consecutive_next}".html_safe
      render  :pdf => template.name,
              :header => {
                :content => prefix_content
              },
              :footer => {
                :content => prefix_content
              }
    else
      redirect_to :back, :alert=>'Something went wrong...'
    end
  end

  def download_personal_record_file
    @personal_record_file = PersonalRecordFile.find(params[:rec_file_id])
    doc_url = URI.unescape(@personal_record_file.document.url(:original, timestamp: false))
    file = open("#{Rails.root}/public#{doc_url}")
    send_file file
  end

  def matching_date_and_user
    @personal_rec_file = PersonalRecordFile.find(params[:rec_file_id])
    @personal_rec_file.update_attribute(:match_user_id,current_user.id)
    @personal_rec_file.update_attribute(:match_date,Date.today)
    if params[:match]=="true"
      @personal_rec_file.update_attribute(:has_been_matched,true)
    else
      NotificationMailer.match_notification_email(@personal_rec_file.person.user,current_user,@personal_rec_file).deliver
      @personal_rec_file.update_attribute(:has_been_matched,false)
    end
    render :json => @personal_rec_file.match_date
  end

  def auth_to_sign_responsive_letter
    user = User.where(:email=>params[:user][:email]).try(:first)
    if user.present? and user.valid_password?(params[:user][:password])
      new_personal_record_file = PersonalRecordFile.new(params[:personal_record_file])
      if new_personal_record_file.save
        @pdf_content = "#{new_personal_record_file.background_official_doc.responsive_letter}#{new_personal_record_file.motive}".html_safe
        footer_pdf_datetime = new_personal_record_file.created_at.strftime('%Y-%m-%d %H:%M:%S')
        render  :pdf => new_personal_record_file.document_file_name,
                :footer => {
                  :content => "<center><i>--- This has been digitally signed on #{footer_pdf_datetime} ---</i></center>"
                }
      else
        redirect_to :back, :alert=>'Something went wrong...'
      end
    else
      redirect_to :back, :alert=>'E-mail and password not match to sign'
    end
  end

  def generate_responsive_letter
    new_personal_record_file = PersonalRecordFile.new(params[:personal_record_file])
    if new_personal_record_file.save
      @pdf_content = "#{new_personal_record_file.background_official_doc.responsive_letter}#{new_personal_record_file.motive}".html_safe
      render  :pdf => new_personal_record_file.document_file_name
    else
      redirect_to :back, :alert=>'Something went wrong...'
    end
  end

  def update_country_and_state
    @person = Person.find(params[:person][:id])
    if @person.update(params[:person])
      render :nothing=>true, :status => 200
    else
      render :nothing=>true, :status => 503
    end
  end

  def assign_roles #a page to assign new role
    @person = Person.find(params[:id]) rescue nil
    if @person.present?
      @unassigned_roles = Role.get_unassigned(@person.user, current_user.active_role)
      @new_user_role = UsersRole.new(:user_id=>@person.user.id)
    else
      @person = Person.new
      render 'new_assign_roles'
    end
  end

  def upload_document
    @new_personal_record_file = PersonalRecordFile.new(params[:personal_record_file])
    if @new_personal_record_file.save
      redirect_to :back, notice: 'New document is attached'
    else
      redirect_to :back,  alert: 'Validation failed'
    end
  end

  def manage_personal_record_file
    @person = Person.find(params[:id]) rescue nil
    if @person.present?
      @new_personal_record_file = PersonalRecordFile.new
      @attached_docs = @person.personal_record_files.with_attach_user
    end
  end

  def block_or_unblock
    if @person.status
      @person.update_attribute(:status, false)
      redirect_to :back, :alert=>'User is blocked'
    else
      @person.update_attribute(:status, true)
      redirect_to :back, :notice=>'User is unblocked'
    end
  end

  def change_role_status
    users_role = UsersRole.where(:user_id=>params[:users_role][:user_id],:role_id=>params[:users_role][:role_id]).first
    users_role.status = ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include? (params[:users_role][:status])
    if users_role.save!(validate: false)
      render :json=>users_role.status, :status => 200
    else
      render :nothing=>true, :status => 503
    end
  end

  def add_new_role
    @new_user_role = UsersRole.new(params[:users_role])
    if @new_user_role.save
      user = @new_user_role.user
      user.send_confirmation_instructions if user.roles.blank? and user.confirmation_token.present? and user.confirmed_at.blank?
      redirect_to :back, :notice=>'New role is assigned successfully'
    else      
      redirect_to :back, :alert=>'No new role is selected to assign or validation failed'
    end
  end

  def search
    @search_result = Person.search(params,current_user)
    render :json => @search_result
  end

  def get_state_by_country_id
    @states = State.where(:country_id=>params[:country_id])
    render :json => @states
  end

  def get_campus_by_franchise_id
    @campus = Campus.where(:franchise_id=>params[:franchise_id])
    render :json => @campus
  end

  def upload_profile_picture
    @person = current_user.person
    @person.profile_picture = params[:file]
    begin
      @person.save!
      render :json => @person.profile_picture.url(:thumb)
    rescue => e
      render :json => e.to_s, :status=>422
    end
  end

  def index
    @people = Person.all
    respond_with(@people)
  end

  def show
    respond_with(@person)
  end

  def new
    @person = Person.new
    @person.build_person_living_address if @person.person_living_address.blank?
    @person.build_person_work_place if @person.person_work_place.blank?
    respond_with(@person)
  end

  def edit
    @person.build_person_living_address if @person.person_living_address.blank?
    @person.build_person_work_place if @person.person_work_place.blank?
  end

  def create
    @person = Person.new(person_params)
    respond_with(@person) do |format|
      format.html { 
        if @person.save 
          flash[:notice] = 'Person was successfully created.' 
          redirect_to people_url 
        else 
          render 'new'
        end
      }
    end
  end

  def update
    respond_with(@person) do |format|
      format.html { 
        if @person.update(person_params)
          previous_url = URI(request.referer).path rescue nil
          if (previous_url.present? and previous_url.include? 'profile') 
            flash[:notice] = 'Profile was successfully updated.'
            redirect_to previous_url
          else
            flash[:notice] = 'Person was successfully updated.'
            redirect_to people_url
          end 
        else 
          render 'edit'
        end
      }
    end
  end

  def destroy
    @person.destroy
    respond_with(@person)
  end

  def profile
    @profile = @person
    @person.person_living_address = PersonLivingAddress.new if @person.person_living_address.blank?
    @person.person_work_place = PersonWorkPlace.new if @person.person_work_place.blank?
    @attached_docs = @person.personal_record_files.with_attach_user
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(
        :franchise_id,
        :campus_id,
        :curp, 
        :rfc, 
        :email, 
        :name, 
        :fathers_maiden_name, 
        :mothers_maiden_name, 
        :country_id, 
        :state_id, 
        :birthday,
        :profile_picture,
        person_living_address_attributes: [:id, :street, :num_ext, :num_int, :colonia, :cp, :municipio, :state_id, :country_id, :phone_emergency],
        person_work_place_attributes: [:id, :empresa, :puesto, :calle, :municipio, :num_ext, :num_int, :colonia, :cp, :state_id, :country_id],
        person_emails_attributes: [:id, :email, :_destroy],
        contact_telephones_attributes: [:id, :phone_number, :phone_type, :_destroy],
        related_people_attributes: [:id, :full_name, :relation_name, :_destroy]
      )
    end
end

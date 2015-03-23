class PeopleController < ApplicationController
  load_and_authorize_resource
  before_action :set_person, only: [:show, :edit, :update, :destroy, :profile, :assign_roles]

  respond_to :html

  def assign_roles #a page to assign new role
    @unassigned_roles = Role.get_unassigned(@person.user, current_user.active_role)
    @new_user_role = UsersRole.new(:user_id=>@person.user.id)
  end

  def change_role_status
    users_role = UsersRole.where(:user_id=>params[:users_role][:user_id],:role_id=>params[:users_role][:role_id]).first
    users_role.status = ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include? (params[:users_role][:status])
    if users_role.save!(validate: false)
      render :nothing=>true, :status => 200
    else
      render :nothing=>true, :status => 503
    end
  end

  def search_by_name
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

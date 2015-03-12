class PeopleController < ApplicationController
  load_and_authorize_resource
  before_action :set_person, only: [:show, :edit, :update, :destroy, :profile]

  respond_to :html

  def search
    @search_result = Person.search(params)
    render :json => @search_result
  end

  def get_state_by_country_id
    @states = State.where(:country_id=>params[:country_id])
    render :json => @states
  end

  def upload_profile_picture
    @person = current_user.person
    @person.profile_picture = params[:file]
    @person.save
    render :json => @person.profile_picture.url(:thumb)
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

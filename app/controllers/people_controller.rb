class PeopleController < ApplicationController
  load_and_authorize_resource
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @people = Person.all
    respond_with(@people)
  end

  def show
    respond_with(@person)
  end

  def new
    @person = Person.new
    respond_with(@person)
  end

  def edit
  end

  def create
    @person = Person.new(person_params)
    flash[:notice] = 'Person was successfully created.' if @person.save
    respond_with(@person)
  end

  def update
    flash[:notice] = 'Person was successfully updated.' if @person.update(person_params)
    respond_with(@person)
  end

  def destroy
    @person.destroy
    respond_with(@person)
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
        :contact_street,
        :contact_num_ext,
        :contact_num_int,
        :contact_colonia,
        :contact_cp,
        :contact_municipio,
        :contact_state,
        :contact_country,
        :contact_phone_emergency,
        :empresa,
        :puesto,
        :calle,
        :municipio,
        :work_num_ext,
        :work_num_int,
        :work_country,
        :work_colonia,
        :work_cp,
        :work_state,
        :contact_state_id, :contact_country_id, :work_country_id, :work_state_id,
        related_people_attributes: [:id, :full_name, :relation_name, :_destroy]
      )
    end
end

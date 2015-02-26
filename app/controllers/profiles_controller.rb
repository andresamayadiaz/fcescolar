class ProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    flash[:notice] = 'Profile was successfully created.' if @profile.save
    respond_with(@profile)
  end

  def update
    flash[:notice] = 'Profile was successfully updated.' if @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  def upload_avatar
    @profile = current_user.profile
    @profile.avatar = params[:file]
    @profile.save
    render :json => @profile.avatar.url(:thumb)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def avatar_params
      params.require(:profile).permit(:avatar)
    end

    def profile_params
      params.require(:profile).permit(:user_id, :last_academic_degree, :country_id, :state_id, :street, :external, :internal, :colonia, :cp, :city, :emergency_phone, :additional_email_1, :additional_email_2, :phones_1, :phone_type_1, :phones_2, :phone_type_2, :avatar)
    end
end

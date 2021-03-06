class UsersController < ApplicationController
  load_and_authorize_resource :except => [:set_active_role]

  def set_active_role
    @user = current_user
    session[:active_franchise] = active_role_params[:active_franchise]
    if @user.update_attributes(active_role_params) and @user.active_role.present?
      redirect_to root_path, :notice => "Done"
    else
      redirect_to root_path, :alert => "Unable to set active role. Please set active franchise if you choose Super Administrator"
    end
  end

  def update_selected_franchise
    @user = current_user
    if @user.update_attributes(active_franchise_params)
      session[:active_franchise] = @user.active_franchise
      franchise = Franchise.find(@user.active_franchise)
      flash[:notice]= "You select to work with #{franchise.name} franchise"
    else
      flash[:notice]='Unable to change selected franchise'
    end
    redirect_to root_path
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def update_password
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      NotificationMailer.password_changes(@user).deliver
      flash[:notice] = 'General information is updated'
    else
      flash[:error] = 'Failed to change general information'
    end
    redirect_to "/profile/#{@user.person.id}"
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation, :email, :active_franchise)
  end

  def active_role_params
    params.required(:user).permit(:active_role, :active_franchise)
  end

  def active_franchise_params
    params.required(:user).permit(:active_franchise)
  end

  def secure_params
    params.require(:user).permit(:franchise_id, :email)
  end

end

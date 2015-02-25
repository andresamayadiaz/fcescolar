class UsersController < ApplicationController
  load_and_authorize_resource :except => [:set_active_role]

  def set_active_role
    @user = current_user
    if @user.update_attributes(active_role_params)
      redirect_to root_path, :notice => "Done"
    else
      redirect_to root_path, :alert => "Unable to set active role."
    end
  end

  def index
    @users = User.all
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
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      flash[:notice] = 'General information is updated'
    else
      flash[:error] = 'Failed to change general information'
    end
    redirect_to profile_path(:id=>@user.profile.id)
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation, :email)
  end

  def active_role_params
    params.required(:user).permit(:active_role)
  end

  def secure_params
    params.require(:user).permit(:role)
  end

end

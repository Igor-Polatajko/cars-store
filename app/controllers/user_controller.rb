class UserController < ApplicationController
  before_action :admin_only, only: [:destroy]
  before_action :user_only, only: [:edit, :update]
  before_action :guest_only, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      redirect_to login_url 
    else
      render :new 
    end 
  end

  def edit
    @user = @current_user
  end

  def update

    if !@current_user.authenticate(params[:user][:current_password])
      flash[:error] = "Current password must be specified and valid"
    elsif(@current_user.update(user_params))
      flash[:notice] = "User was successfully updated"
    else
      flash[:error] = "Error while updating user"
    end

    redirect_to edit_user_path
  end

  def deactivate
    return set_user_account_state(false)
  end

  def activate
    return set_user_account_state(true)
  end

  private 
    
    def set_user_account_state(active)
      user = User.find(params[:id])

      if !user.present?
        flash[ :error] = "User not found"
        return redirect_to 'admin_path'
      end
  
      user.active = active
      if user.save
        flash[:notice] = "User account state successfully updated"
      else
        flash[:error] = "Error while changing user's account state"
      end
      
      redirect_to admin_path 
    end

    def user_params
      params.require(:user).permit(:name, :surname, :email, :phone_number, :password, :password_confirmation)
    end
end

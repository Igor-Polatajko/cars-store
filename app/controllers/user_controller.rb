class UserController < ApplicationController
  require 'securerandom'

  before_action :admin_only, only: [:destroy]
  before_action :user_only, only: [:edit, :update]
  before_action :guest_only, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.confirmation_token = SecureRandom.urlsafe_base64

    if @user.save 
      UserMailer.send_confirmation_token(@user).deliver_later
      redirect_to login_url 
    else
      render :new 
    end 
  end

  def confirm_email
    user = User.find_by_confirmation_token(params[:token])
     
    unless user
      return redirect_to main_page_index_path
    end

    if user.email_confirmed
      flash[:alert] = "User is already confirmed!"
      return redirect_to login_url
    end

    user.update_column(:email_confirmed, true)

    flash[:info] = "Email was confirmed!"
    redirect_to login_url
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

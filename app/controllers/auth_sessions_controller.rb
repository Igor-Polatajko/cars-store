class AuthSessionsController < ApplicationController
  before_action :guest_only, only: [:new, :create]
  before_action :user_only, only: [:destroy]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])

      unless user.email_confirmed
        flash[:alert] = "User account is not confirmed, follow the link sent you via email to confirm account!"
        return redirect_to login_url
      end 

      if user.active
        session[:user_id] = user.id
        flash[:notice] = "Logged in!"
        return redirect_to main_page_index_url
      end

      flash[:alert] = "User account is not active, contact administrator!"
      return redirect_to login_url
    else
      flash[:alert] = "Email or password is invalid"
      return redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end
end

class AuthSessionsController < ApplicationController
   # TODO: guest_only
  def new
  end

  # TODO: guest_only
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to main_page_index_url, notice: "Logged in!"
    else
      flash[:alert] = "Email or password is invalid"
      redirect_to login_url
    end
  end

   # TODO: guest_only
  def destroy
    session[:user_id] = nil
    redirect_to main_page_index_url, notice: "Logged out!"
  end
end

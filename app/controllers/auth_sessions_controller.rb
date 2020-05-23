class AuthSessionsController < ApplicationController
  include AccessControl

  before_action :guest_only, only: [:new, :create]
  before_action :user_only, only: [:destroy]

  def new
  end

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

  def destroy
    session[:user_id] = nil
    redirect_to main_page_index_url, notice: "Logged out!"
  end
end

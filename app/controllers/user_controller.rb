class UserController < ApplicationController
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
  end

  def update
  end

  def destroy
  end

  private 
    def user_params
      params.require(:user).permit(:name, :surname, :email, :phone_number, :password)
    end
end

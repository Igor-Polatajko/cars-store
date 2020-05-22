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
    unless @current_user.present?
      return redirect_to new_user_path
    end

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

  def destroy
  end

  private 
    def user_params
      params.require(:user).permit(:name, :surname, :email, :phone_number, :password, :password_confirmation)
    end
end

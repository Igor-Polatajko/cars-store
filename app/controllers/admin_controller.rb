class AdminController < ApplicationController
  before_action :admin_only

  def index
    @users = User.order(is_admin: :desc, name: :asc, surname: :asc).paginate(page: params[:page], per_page: 8)
  end
end

class MainPageController < ApplicationController

  def index
    @car_records = CarRecord.order(:title).paginate(page: params[:page], per_page: 6)
  end
end

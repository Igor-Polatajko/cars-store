class MainPageController < ApplicationController
  def index
    @car_records = CarRecord.order(:title)
  end
end

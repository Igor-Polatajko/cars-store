class OrderRequestController < ApplicationController
  def new
    @car_record = CarRecord.find(params[:id])
  end
end

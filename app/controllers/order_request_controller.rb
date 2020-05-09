class OrderRequestController < ApplicationController
  require 'securerandom'

  def new
    @order_request = OrderRequest.new
    @car_record_id = params[:id]
  end

  def create
    if !request.post?
      redirect_to main_page_index_path
      return
    end

    order_request_values = order_request_params
    order_request_values[:confirmed] = false
    order_request_values[:confirmation_token] = SecureRandom.urlsafe_base64

    order_request = OrderRequest.create(order_request_values)

    OrderRequestsMailer.send_confirmation_request(order_request).deliver_later
    render :template => "order_request/submitted"
  end

  def confirm
    order_request = OrderRequest.find_by_confirmation_token(params[:token])

    if !order_request
      redirect_to main_page_index_path
    end

    if order_request.confirmed
      @info = "Order is already confirmed!"
      render :template => "order_request/confirmed"
      return
    end

    order_request.confirmed = true
    order_request.save

    OrderRequestsMailer.send_car_owner_notification(order_request).deliver_later
    @info = "Order is successfully confirmed!"
    render :template => "order_request/confirmed"
  end

  private
    def order_request_params
      params.require(:order_request).permit(:name, :surname, :email, :phone_number, :comment, :car_record_id)
    end

end

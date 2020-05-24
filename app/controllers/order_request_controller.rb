class OrderRequestController < ApplicationController
  require 'securerandom'

  def new
    @order_request = OrderRequest.new
    @car_record_id = params[:id]
  end

  def create
    if !request.post?
      return redirect_to main_page_index_path
    end

    car_record_id = params[:order_request][:car_record_id]
    user_email = params[:order_request][:email]
    if car_record_id.nil? || user_email.nil?
      return redirect_to main_page_index_path
    end

    begin
      car_record = CarRecord.find(car_record_id)
    rescue ActiveRecord::RecordNotFound
      @message = "Car not found!"
      return render template: "order_request/error"
    end

    if is_owner(car_record_id) || car_record_id.user.email == user_email
      @message = "You cannot order your own car!"
      return render template: "order_request/error"
    end

    order_request_values = order_request_params
    order_request_values[:confirmed] = false
    order_request_values[:confirmation_token] = SecureRandom.urlsafe_base64

    order_request = OrderRequest.create(order_request_values)

    OrderRequestsMailer.send_confirmation_request(order_request).deliver_later
    render template: "order_request/submitted"
  end

  def confirm
    order_request = OrderRequest.find_by_confirmation_token(params[:token])

    if !order_request
      redirect_to main_page_index_path
    end

    if order_request.confirmed
      return render template: "order_request/error", message: "Order is already confirmed!"
    end

    order_request.confirmed = true
    order_request.save

    OrderRequestsMailer.send_car_owner_notification(order_request).deliver_later
    OrderRequestsMailer.send_order_request_info_to_customer(order_request).deliver_later
    render template: "order_request/confirmed"
  end

  private
    def order_request_params
      params.require(:order_request).permit(:name, :surname, :email, :phone_number, :comment, :car_record_id)
    end

end

class OrderRequestController < ApplicationController
  require 'securerandom'

  before_action :user_only, only: [:show_current_user_created_order_requests, :show_current_user_received_order_requests]

  def new
    @order_request = OrderRequest.new
    @car_record_id = params[:id]
  end

  def show_current_user_created_order_requests
    @order_requests = OrderRequest.where(email: @current_user.email)
                                  .order('created_at DESC')
                                  .paginate(page: params[:page], per_page: 8)
  end

  def show_current_user_received_order_requests
    car_records_ids_of_current_user = @current_user.car_records.pluck(:id)
    @order_requests = OrderRequest.where(car_record_id: car_records_ids_of_current_user, confirmed: true)
                                  .order('created_at DESC')
                                  .paginate(page: params[:page], per_page: 8)
  end

  def create
    if !request.post?
      if @current_user.present?
        return redirect_to current_user_created_order_requests_path
      else
        return redirect_to main_page_index_path
      end
    end

    car_record_id = params[:order_request][:car_record_id]
    user_email = params[:order_request][:email]
    if car_record_id.nil? || user_email.nil?
      return redirect_to main_page_index_path
    end

    car_record = CarRecord.find_by(id: car_record_id)
    if car_record.nil?
      @message = "Car not found!"
      return render template: "order_request/error"
    end

    if is_owner(car_record_id) || car_record.user.email == user_email
      @message = "You cannot order your own car!"
      return render template: "order_request/error"
    end

    existing_order_request = OrderRequest.where(car_record_id: car_record_id, email: user_email)
    if existing_order_request.present?
      @message = "You have already created the order request of this car item!"
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

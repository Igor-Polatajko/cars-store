class OrderRequestController < ApplicationController
  def new
    @order_request = OrderRequest.new
    @car_record_id = params[:id]
  end

  def create
    if !request.post?
      redirect_to main_page_index_path
      return
    end

    order_request = OrderRequest.new(order_request_params)

    if order_request.save
      OrderRequestsMailer.send_confirmation_request(order_request).deliver_later
      render :template => "order_request/submitted"
    else 
      redirect_to new_order_request_path(params[:car_record_id])
    end
  end

  def confirm
    #activate the order

    #send email to car owner
  end

  private
    def order_request_params
      params.require(:order_request).permit(:name, :surname, :email, :phone_number, :comment, :car_record_id)
    end

end

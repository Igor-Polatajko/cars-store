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

    @car_record = CarRecord.find(params[:car_record_id])

    #send email with confirmation link

    render :template => "order_request/submitted"
  end

  def confirm
    #activate the order

    #send email to car owner
  end

end

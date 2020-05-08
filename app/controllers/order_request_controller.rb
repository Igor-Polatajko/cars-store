class OrderRequestController < ApplicationController
  def new
    @order_request = OrderRequest.new
  end

  def create
    if !request.post?
      redirect_to main_page_index_path
      return
    end

    #send email with confirmation link

    render :template => "order_request/submitted"
  end

  def confirm
    #activate the order

    #send email to car owner
  end

end

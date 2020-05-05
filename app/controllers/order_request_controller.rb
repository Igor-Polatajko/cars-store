class OrderRequestController < ApplicationController
  def new
    @order_request = OrderRequest.new
  end

  def create
  end
end

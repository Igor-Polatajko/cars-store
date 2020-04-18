class ErrorController < ApplicationController
  def show
    if flash[:error].blank?
      flash[:error] = "Requested resource not found!"
    end
  end
end

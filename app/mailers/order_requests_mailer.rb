class OrderRequestsMailer < ApplicationMailer

    def send_confirmation_request(order_request)
        @order_request = order_request
        mail to: order_request.email, subject: 'Car store order request confirmation'
    end

end

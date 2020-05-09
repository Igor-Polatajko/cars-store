class OrderRequestsMailer < ApplicationMailer

    def send_confirmation_request(order_request)
        @order_request = order_request
        mail to: order_request.email, subject: 'Car store order request confirmation'
    end

    def send_car_owner_notification(order_request)
        @order_request = order_request
        mail to: order_request.car_record.user.email, subject: 'You have received an order request at CarStore'
    end

end

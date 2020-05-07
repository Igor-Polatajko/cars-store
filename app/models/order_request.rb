class OrderRequest < ApplicationRecord
    validates :name, :surname, :email, presence: true
    validates :phone_number, presence: true, length: { is: 10 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

class OrderRequest < ApplicationRecord
    belongs_to :car_record
    validates :name, :surname, presence: true
    validates :phone_number, presence: true, length: { is: 10 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

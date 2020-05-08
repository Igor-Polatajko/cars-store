class OrderRequest < ApplicationRecord
    has_and_belongs_to_many :car_records
    validates :name, :surname, :email, presence: true
    validates :phone_number, presence: true, length: { is: 10 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

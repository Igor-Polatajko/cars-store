class User < ApplicationRecord
  has_secure_password

  validates :name, :surname, :phone_number, presence: true 
  validates :phone_number, presence: true, length: { is: 10 } 
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

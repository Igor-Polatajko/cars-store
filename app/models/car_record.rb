class CarRecord < ApplicationRecord
    has_many_attached :images
    has_many :line_items, dependent: :destroy
    has_many :order_requests
    belongs_to :user
    validates :title, :description, :price, :images, :user, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :images, length: {maximum:5, message: "maximum number of images is 5"}
end

class CarRecord < ApplicationRecord
    has_many_attached :images
    validates :title, :description, :price, :images, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :images, length: {maximum:5, message: "maximum number of images is 5"}
end

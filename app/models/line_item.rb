class LineItem < ApplicationRecord
  belongs_to :car_record
  belongs_to :saved_collection
end

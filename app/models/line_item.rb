class LineItem < ApplicationRecord
    belongs_to :saved_collection
    belongs_to :car_record
end

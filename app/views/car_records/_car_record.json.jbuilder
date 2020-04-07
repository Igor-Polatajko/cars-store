json.extract! car_record, :id, :title, :description, :price, :created_at, :updated_at
json.url car_record_url(car_record, format: :json)

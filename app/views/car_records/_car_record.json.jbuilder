json.extract! car_record, :id, :title, :description, :price, :created_at, :updated_at
json.images do
    json.array! car_record.images.each do |image|
        json.img url_for(image)
    end
end

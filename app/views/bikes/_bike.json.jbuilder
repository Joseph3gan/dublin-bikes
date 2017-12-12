json.extract! bike, :id, :title, :description, :price, :image_url, :duration, :created_at, :updated_at
json.url bike_url(bike, format: :json)

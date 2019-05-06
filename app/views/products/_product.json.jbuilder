json.extract! product, :id, :name, :amount, :unit_price, :created_at, :updated_at
json.url product_url(product, format: :json)

json.extract! salesproduct, :id, :unit, :total_price, :created_at, :updated_at
json.url salesproduct_url(salesproduct, format: :json)

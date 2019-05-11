json.extract! reqitem, :id, :amount, :created_at, :updated_at
json.url reqitem_url(reqitem, format: :json)

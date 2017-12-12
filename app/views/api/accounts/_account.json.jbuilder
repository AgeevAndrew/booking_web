json.extract! account, :id, :name, :phone, :email, :addresses, :created_at, :updated_at
json.url api_account_url(account, format: :json)

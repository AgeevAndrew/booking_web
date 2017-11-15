json.extract! company, :id, :name, :categories, :description, :contact_info, :delivery, :created_at, :updated_at
json.url company_url(company, format: :json)

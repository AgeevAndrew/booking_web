json.extract! company, :id, :name, :categories, :description, :contact_info, :delivery, :created_at, :updated_at
json.url api_company_url(company, format: :json)

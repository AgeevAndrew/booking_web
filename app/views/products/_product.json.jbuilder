json.extract! product, :id, :category_id, :company_id, :title, :description, :brief, :photo, :main_options, :additional_info, :created_at, :updated_at
json.url product_url(product, format: :json)

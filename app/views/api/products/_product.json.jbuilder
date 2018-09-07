json.extract! product, :id, :category_id, :company_id, :title, :description, :brief, :photo, :main_options, :additional_info, :created_at, :updated_at, :active
json.url api_product_url(product, format: :json)

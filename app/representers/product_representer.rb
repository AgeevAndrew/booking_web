# frozen_string_literal: true

class ProductRepresenter < ApplicationRepresenter
  property :company_id
  property :category_id
  property :title
  property :description
  property :photo
  property :main_options
  property :additional_info
end

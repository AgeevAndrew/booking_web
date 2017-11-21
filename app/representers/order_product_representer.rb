# frozen_string_literal: true

class OrderProductRepresenter < ApplicationRepresenter
  property :id
  property :order_id
  property :product_id
  property :product_title, getter: ->(represented:, **) { represented.product.title }
  property :qty
  property :main_option
  property :total_cost
  collection :ingredients
end

# frozen_string_literal: true

class OrderRepresenter < ApplicationRepresenter
  property :id
  property :account_id
  property :company_id
  property :address_info
  property :total_cost
  collection :order_products, decorator: OrderProductRepresenter
end

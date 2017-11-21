# frozen_string_literal: true

class OrderRepresenter < ApplicationRepresenter
  property :id
  property :account_id
  property :company_id
  property :num
  property :address_info
  property :total_cost
  property :delivery_cost
  property :delivery_time
  property :pickup
  property :status, getter: ->(represented:, **) { represented.status.name }
  property :created_at
  property :updated_at
  collection :order_products, decorator: OrderProductRepresenter
end

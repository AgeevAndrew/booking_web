# frozen_string_literal

module Orders::Representers
  class OrdersProductsRepresenter < ApplicationRepresenter
    collection :orders, decorator: OrderRepresenter
    collection :order_products, decorator: OrderProductRepresenter
  end
end

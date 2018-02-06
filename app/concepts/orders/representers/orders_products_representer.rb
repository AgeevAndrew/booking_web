# frozen_string_literal: true

module Orders::Representers
  class OrdersProductsRepresenter < ApplicationRepresenter
    collection :orders, decorator: OrderRepresenter
    collection :order_products, decorator: OrderProductRepresenter
    collection :products, decorator: ProductRepresenter
    collection :accounts, decorator: AccountRepresenter
  end
end

# frozen_string_literal: true

module Orders
  class Filter < ApplicationOperation
    representer Representers::OrdersProductsRepresenter

    Facade = Struct.new(
      :orders,
      :order_products,
    )

    def represented
      Facade.new(orders, order_products)
    end

    private

    def orders
      Order
        .where(company_id: current_user.company_id)
        .eager_load(:status)
        .order(created_at: :desc)
    end

    def order_products
      OrderProduct.where(order_id: orders.map(&:id))
    end
  end
end

# frozen_string_literal: true

module Orders
  class Filter < ApplicationOperation
    representer Representers::OrdersProductsRepresenter

    Facade = Struct.new(
      :orders,
      :order_products,
      :products,
      :accounts,
    )

    def represented
      Facade.new(orders, order_products, products, accounts)
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

    def products
      Product.where(id: order_products.map(&:product_id))
    end

    def accounts
      Account.where(id: orders.map(&:account_id))
    end
  end
end

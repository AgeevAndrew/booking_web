# frozen_string_literal: true

module Store::Facades
  class OrdersFacade < BaseFacade
    def orders
      Order
        .where(company_id: company_ids)
        .eager_load(:status)
        .order(created_at: :desc)
    end

    def order_products
      OrderProduct.where(order_id: order_ids)
    end

    def products
      Product.where(id: order_products.map(&:product_id))
    end

    def accounts
      Account.where(id: orders.map(&:account_id))
    end

    private

    def order_ids
      @order_ids ||= orders.map(&:id)
    end
  end
end

# frozen_string_literal: true

class OperatorMailer < ApplicationMailer
  def new_order(operators, order_id)
    @order = Order.find(order_id)
    @order_token = OrderToken.find_by(order_id: order_id)
    mail(to: operators, subject: t('.subject', num: @order.num))
  end
end

# frozen_string_literal: true

class OperatorMailer < ApplicationMailer
  def new_order(operators, order_id)
    @order = Order.find(order_id).decorate
    @order_token = OrderToken.find_by(order_id: order_id)
    mail(to: operators, subject: t('.subject', num: @order.num))
  end

  def cancel_order(operators, order_id)
    @order = Order.find(order_id).decorate
    mail(to: operators, subject: t('.subject', num: @order.num))
  end
end

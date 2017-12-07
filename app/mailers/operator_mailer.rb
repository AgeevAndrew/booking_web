# frozen_string_literal: true

class OperatorMailer < ActionMailer::Base
  def new_order(operators, order_id)
    @order = Order.find(order_id)
    mail(to: operators, subject: t('.subject', num: @order.num))
  end
end

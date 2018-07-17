# frozen_string_literal: true

class CancelOrderPropogateJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find_by(id: order_id)

    return unless order&.cancel?
    OrderToken.where(order_id: order_id).delete_all

    OperatorMailer.cancel_order(operators, order_id).deliver_later
  end
end

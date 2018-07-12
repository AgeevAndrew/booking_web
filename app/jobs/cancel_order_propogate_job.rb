# frozen_string_literal: true

class CancelOrderPropogateJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    OperatorMailer.cancel_order(operators, order_id).deliver_later
  end
end

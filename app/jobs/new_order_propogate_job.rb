# frozen_string_literal: true

class NewOrderPropogateJob < ApplicationJob
  queue_as :high_priority

  def perform(order_id)
    @order = Order.find(order_id)
    # TODO, make tokens
    OperatorMailer.new_order(operators, order_id).deliver_later
  end

  private

  attr_reader :order

  def operators
    order.company.contact_info['email']
  end
end

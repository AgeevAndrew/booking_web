# frozen_string_literal: true

class NewOrderPropogateJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    @order = Order.find(order_id)
    make_token
    OperatorMailer.new_order(operators, order_id).deliver_later
  end

  private

  attr_reader :order

  def operators
    return order.company.contact_info['email'] if Rails.env.production?
    ['arkhipovky@arink-group.ru', 'bodakovda@arink-group.ru']
  end

  def make_token
    OrderToken.create(order_id: order.id, token: SecureRandom.urlsafe_base64(256))
  end
end

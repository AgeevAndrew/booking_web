# frozen_string_literal: true

class OperatorMailerPreview < ActionMailer::Preview
  def new_order_ru
    I18n.locale = :ru
    OperatorMailer.new_order(emails, order.id)
  end

  def new_order_en
    I18n.locale = :en
    OperatorMailer.new_order(emails, order.id)
  end

  private

  def order
    Order.first
  end

  def emails
    [
      'user1@example.com',
      'user2@example.com',
    ]
  end
end

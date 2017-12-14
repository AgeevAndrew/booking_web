# frozen_string_literal: true

class OrderDecorator < ApplicationDecorator
  delegate_all

  def address_inline
    [
      address_info['city'],
      address_info['street'],
      address_info['house'] && ["д. #{address_info['house']}", address_info['office']].compact.join(' - '),
    ].join ', '
  end
end

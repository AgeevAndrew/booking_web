# frozen_string_literal: true

class OrderDecorator < ApplicationDecorator
  delegate_all

  def address_inline
    [
      address_info['city'],
      address_info['street'],
      address_info['house'] && ["д. #{address_info['house']}", address_info['office']].compact.join(' - '),
      address_info['entrance'].presence && "подъезд. #{address_info['entrance']}",
      address_info['floor'].presence && "этаж #{address_info['floor']}",
      address_info['code'].presence && "код домофона #{address_info['code']}",
    ].compact.join ', '
  end

  def delivery_localtime(zone = 'UTC')
    delivery_time.in_time_zone(zone)
  end
end

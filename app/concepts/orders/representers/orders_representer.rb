# frozen_string_literal

module Orders::Representers
  class OrdersRepresenter < ApplicationRepresenter
    collection :orders, decorator: OrderRepresenter
  end
end

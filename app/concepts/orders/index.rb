# frozen_string_literal: true

class Orders::Index < ApplicationOperation
  representer Representers::OrdersRepresenter

  Facade = Struct.new(
    :orders,
  )

  def represented
    Facade.new(@model)
  end

  def model!(params)
    Order
      .where(account_id: params[:account_id])
      .eager_load(:status)
      .order(created_at: :desc)
  end
end

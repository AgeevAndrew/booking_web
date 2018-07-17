# frozen_string_literal: true

class Orders::Cancel < ApplicationOperation
  representer OrderRepresenter

  def model!(params)
    Order.find_by(id: params[:id])
  end

  def process(*)
    model.cancel!
    model.save

    CancelOrderPropogateJob.perform_later(model.id)
  end
end

# frozen_string_literal: true

class Orders::Accept < ApplicationOperation
  representer OrderRepresenter

  def model!(params)
    Order.find(params[:id])
  end

  def process(*)
    model.accept!
    model.save
  end
end

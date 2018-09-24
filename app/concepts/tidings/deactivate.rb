# frozen_string_literal: true

class Tidings::Deactivate < ApplicationOperation
  representer TidingRepresenter

  def model!(params)
    Tiding.find(params[:id])
  end

  def process(*)
    model.deactivate!
    model.save
  end
end

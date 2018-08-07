# frozen_string_literal: true

class Tidings::Activate < ApplicationOperation
  representer TidingRepresenter

  def model!(params)
    Tiding.find(params[:id])
  end

  def process(*)
    model.activate!
    model.save
  end
end

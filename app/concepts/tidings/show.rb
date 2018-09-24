# frozen_string_literal: true

module Tidings
  class Show < ApplicationOperation
    representer TidingRepresenter

    def model!(params)
      Tiding.find(params[:id])
    end
  end
end

# frozen_string_literal: true

module Tidings
  class Tidings::Create < ApplicationOperation
    contract Forms::CreateForm

    representer TidingRepresenter

    def represented
      model.reload
    end

    def model!(params)
      Tiding.new(params)
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end

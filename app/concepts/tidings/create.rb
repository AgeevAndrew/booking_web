# frozen_string_literal: true

module Tidings
  class Create < ApplicationOperation
    contract Forms::CreateForm

    representer TidingRepresenter

    def represented
      model.reload
    end

    def model!(*)
      Tiding.new(active: :on, company_id: current_user.company_id)
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end

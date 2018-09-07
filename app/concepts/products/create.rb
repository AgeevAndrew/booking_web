# frozen_string_literal: true

module Products
  class Create < ApplicationOperation
    representer ProductRepresenter

    contract Forms::CreateForm

    def model!(*)
      Product.new(company_id: current_user.company_id)
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end

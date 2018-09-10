# frozen_string_literal: true

module Products
  class Update < ApplicationOperation
    representer ProductRepresenter

    contract Forms::UpdateForm

    def model!(params)
      Product.find params[:id]
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end

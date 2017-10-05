# frozen_string_literal: true

module Products
  class Find < ApplicationOperation
    contract Forms::FindForm

    representer Representers::ProductsRepresenter

    Facade = Struct.new(
      :products,
    )

    def represented
      Facade.new(@result)
    end

    def process(params)
      validate(params) do
        @result = Product.where(company_id: contract.company_id)
        @result = @result.where(category_id: contract.category_id) if contract.category_id.present?
        @result
      end
    end
  end
end

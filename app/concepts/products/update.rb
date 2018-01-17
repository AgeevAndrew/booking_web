# frozen_string_literal: true

class Products::Update < ApplicationOperation
  representer ProductRepresenter

  contract Forms::CreateForm

  def model!(params)
    Product.find params[:id]
  end

  def process(params)
    validate(params) do
      contract.save
    end
  end
end

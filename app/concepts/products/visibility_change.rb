# frozen_string_literal: true

class Products::VisibilityChange < ApplicationOperation
  representer ProductRepresenter

  contract do
    property :active

    validates :active, inclusion: { in: [true, false] }
  end

  def model!(params)
    Product.find params[:id]
  end

  def process(params)
    validate(params) do
      contract.save
    end
  end
end

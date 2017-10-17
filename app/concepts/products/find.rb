# frozen_string_literal: true

class Products::Find < ApplicationOperation
  representer Representers::ProductsRepresenter

  Facade = Struct.new(
    :products,
  )

  def represented
    Facade.new(@result)
  end

  def process(params)
    @result = Product.all
    @result = @result.where(company_id: params[:company_id]) if params[:company_id].present?
    @result = @result.where(category_id: params[:category_id]) if params[:category_id].present?
  end
end

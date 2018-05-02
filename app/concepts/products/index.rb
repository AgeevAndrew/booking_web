# frozen_string_literal: true

class Products::Index < ApplicationOperation
  representer Products::Representers::IndexRepresenter

  Facade = Struct.new(
    :categories,
    :products,
  )

  def represented
    Facade.new(@categories, @products)
  end

  def process(params)
    company = params[:current_user].company
    @categories = Category.all
    @products = Product.without_deleted
    if company
      @products = @products.where(company_id: company.id)
      @categories = @categories.where(id: company.categories)
    end
  end
end

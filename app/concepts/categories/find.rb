# frozen_string_literal: true

class Categories::Find < ApplicationOperation
  representer Representers::CategoriesRepresenter

  Facade = Struct.new(
    :categories,
  )

  def represented
    Facade.new(@result)
  end

  def model!(params)
    Company.find params[:company_id]
  end

  def process(*)
    @result = Category.where(id: model.categories)
  end
end

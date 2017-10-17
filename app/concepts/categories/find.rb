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
    Company.find_by(id: params[:company_id])
  end

  def process(*)
    @result = Category.all
    @result = @result.where(id: model.categories) if model.present?
  end
end

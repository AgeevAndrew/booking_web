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
    @result = Category.where(id: active_category_ids)
    @result = @result.where(id: model.categories) if model.present?
  end

  private

  def active_category_ids
    result = Product.actives.select(:category_id)
    result = result.where(company_id: model.id) if model.present?
    result
  end
end

# frozen_string_literal: true

class Orders::Create < ApplicationOperation
  contract Forms::CreateForm

  representer OrderRepresenter

  def model!(*)
    Order.new
  end

  def process(params)
    validate(params) do
      contract.sync
      assign_special_attributes
      model.save
    end
  end

  private

  def assign_special_attributes
    assign_products_cost
    model.total_cost = order_cost
    model.address_info = contract.address.to_json
  end

  def order_cost
    contract.order_products.map do |op|
      op.model.total_cost
    end.sum
  end

  def assign_products_cost
    contract.order_products.each do |op|
      op.model.total_cost = op.qty * (
        op.product_main_option[0]['cost'].to_f + op.ingredients.map { |i| i.qty * i.ingredient['cost'].to_f }.sum
      )
    end
  end
end

# frozen_string_literal: true

class Orders::Create < ApplicationOperation
  contract Forms::CreateForm

  representer OrderRepresenter

  def represented
    model.reload
  end

  def model!(*)
    Order.new(status_id: Statuses::NEW)
  end

  def process(params)
    validate(params) do
      assign_special_attributes
      contract.save
    end
  end

  private

  def assign_special_attributes
    assign_products_cost
    model.total_cost = order_cost
    model.delivery_cost = delivery_cost
    model.address_info = contract.address || {}
  end

  def order_cost
    @order_cost ||= contract.order_products.map do |op|
                      op.model.total_cost
                    end.sum * discount
  end

  def assign_products_cost
    contract.order_products.each do |op|
      # I don't agree with this calculation. I believe this is a bullshit!!!
      # True formula = qty * (product_cost + sum_ingridient_costs)
      op.model.total_cost = op.qty * op.product_main_option[0]['cost'].to_f + ingridients_cost(op)
    end
  end

  def ingridients_cost(product)
    product.ingredients.map(&:total_cost).sum
  end

  def delivery_cost
    return 0 if contract.pickup || contract.company.delivery['free_shipping'] <= order_cost
    contract.company.delivery['cost']
  end

  def discount
     return 1 unless contract.pickup
     (1 - contract.company.delivery['pickup_discount'] / 100.0).round(2)
  end
end

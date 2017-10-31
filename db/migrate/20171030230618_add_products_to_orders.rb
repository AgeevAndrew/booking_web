# frozen_string_literal: true

class AddProductsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :products, 'jsonb[]'
  end
end

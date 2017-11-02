# frozen_string_literal: true

class AddProductsToOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products, id: :uuid do |t|
      t.references :product, null: false
      t.references :order, null: false
      t.string :main_option
      t.decimal :total_cost, precision: 18, scale: 2, null: false, default: 0
      t.jsonb :ingredients
    end
  end
end

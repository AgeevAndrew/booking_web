# frozen_string_literal: true

class AddDiscountToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :discount, :decimal, precision: 18, scale: 2, null: false, default: 0
  end
end

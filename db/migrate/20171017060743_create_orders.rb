# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :company
      t.references :account
      t.decimal :total_cost
      t.string :address_name

      t.timestamps
    end
  end
end

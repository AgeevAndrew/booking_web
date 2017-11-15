# frozen_string_literal: true

class AddDeliveryToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :delivery, :jsonb, null: false, default: {}.to_json
  end
end

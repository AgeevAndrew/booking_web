# frozen_string_literal: true

class AddAddressIdsToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :address_ids, 'integer[]', null: false, default: []
  end
end

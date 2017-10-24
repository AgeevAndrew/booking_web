# frozen_string_literal: true

class ReplaceAddressesInAccount < ActiveRecord::Migration[5.1]
  def up
    add_column :accounts, :address_ids, 'integer[]', null: false, default: []
    remove_column :accounts, :addresses
  end

  def down
    add_column :accounts, :addresses, 'jsonb[]', null: false, default: '{}'
    remove_column :accounts, :address_ids
  end
end

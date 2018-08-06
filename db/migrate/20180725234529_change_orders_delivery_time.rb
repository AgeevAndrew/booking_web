class ChangeOrdersDeliveryTime < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :delivery_time, 'datetime', null: true
  end
end

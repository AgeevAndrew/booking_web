class AddDeviceToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :device, :string
  end
end

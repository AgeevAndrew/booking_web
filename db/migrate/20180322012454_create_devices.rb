class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :device_type
      t.text :registration_token
      t.references :company
      t.references :account, type: :uuid

      t.timestamps
    end
  end
end

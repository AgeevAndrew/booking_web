class CreateOrderTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :order_tokens do |t|
      t.references :order, null: false, type: :uuid, foreign_key: true
      t.uuid :token

      t.timestamps
    end
  end
end

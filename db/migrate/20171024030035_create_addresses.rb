# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :title, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :house, null: false
      t.string :office
      t.string :entrance
      t.string :floor
      t.string :code

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email
      t.column :address_ids, 'integer[]', null: false, default: []

      t.timestamps
    end

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
    create_table :company do |t|
      t.string :name, null: false
      t.column :categories, 'integer[]', null: false, default: '{}'
      t.text :description
      t.jsonb :delivery, null: false, default: {}.to_json
      t.jsonb :contact_info, null: false, default: {}.to_json

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name, null: false
      t.string :icon_type, null: false
      t.text :description

      t.timestamps
    end

    create_table :orders, id: :uuid do |t|
      t.references :company
      t.references :account, type: :uuid
      t.references :status, null: false
      t.column :num, 'serial', null: false
      t.jsonb :address_info, null: false, default: {}
      t.decimal :total_cost, null: false
      t.decimal :delivery_cost, null: false, default: 0
      t.boolean :pickup, null: false, default: false
      t.column :delivery_time, 'datetime', null: false

      t.timestamps
    end

    create_table :order_products, id: :uuid do |t|
      t.references :product, null: false
      t.references :order, null: false, type: :uuid
      t.integer :qty, null: false, default: 1
      t.string :main_option
      t.decimal :total_cost, precision: 18, scale: 2, null: false, default: 0
      t.jsonb :ingredients
    end

    create_table :products do |t|
      t.references :category, foreign_key: true
      t.references :company, foreign_key: true
      t.string :title
      t.string :brief, limit: 140
      t.text :description
      t.string :photo
      t.column :main_options, 'jsonb[]', null: false, default: '{}'
      t.column :additional_info, 'jsonb[]', null: false, default: '{}'

      t.timestamps
    end

    add_index :products, [:category_id, :company_id]

    create_table :statuses do |t|
      t.string :name, null: false
      t.column :position, 'smallint', null: false
    end
  end
end

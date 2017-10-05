# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.column :categories, 'integer[]', null: false, default: '{}'
      t.text :description
      t.jsonb :contact_info

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name, null: false
      t.string :icon_type, null: false
      t.text :description

      t.timestamps
    end

    create_table :products do |t|
      t.references :category, foreign_key: true
      t.references :company, foreign_key: true
      t.string :title
      t.text :description
      t.string :photo
      t.column :main_options, 'jsonb[]', null: false, default: '{}'
      t.jsonb :additional_info, null: false, default: '{}'

      t.timestamps
    end

    add_index :products, [:category_id, :company_id]
  end
end

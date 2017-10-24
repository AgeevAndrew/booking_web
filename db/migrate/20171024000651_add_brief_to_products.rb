# frozen_string_literal: true

class AddBriefToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :brief, :string, limit: 140
  end
end

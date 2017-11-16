# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :company
  belongs_to :account
  belongs_to :status

  has_many :order_products, dependent: :destroy
end

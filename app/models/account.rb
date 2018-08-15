# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :devices
  has_many :orders
  def addresses
    Address.where(id: address_ids)
  end
end

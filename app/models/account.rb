# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :devices
  def addresses
    Address.where(id: address_ids)
  end
end

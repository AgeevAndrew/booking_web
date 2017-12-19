# frozen_string_literal: true

class Account < ApplicationRecord
  def addresses
    Address.where(id: address_ids)
  end
end

# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :company
  belongs_to :account
end

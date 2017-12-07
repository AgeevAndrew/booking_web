# frozen_string_literal: true

class OrderToken < ApplicationRecord
  belongs_to :order
end

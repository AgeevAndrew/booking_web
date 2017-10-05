# frozen_string_literal: true

module Products
  class Find < ApplicationOperation
    def model!(*)
      Account.new
    end
  end
end

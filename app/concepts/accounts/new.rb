# frozen_string_literal: true

module Accounts
  class New < ApplicationOperation
    def model!(*)
      Account.new
    end
  end
end

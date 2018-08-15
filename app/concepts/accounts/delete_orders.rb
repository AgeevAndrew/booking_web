# frozen_string_literal: true

module Accounts
  class DeleteOrders < ApplicationOperation
    def process(params)
      Account.find(params[:id]).orders.destroy_all
    end
  end
end

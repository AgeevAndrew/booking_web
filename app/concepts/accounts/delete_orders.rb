# frozen_string_literal: true

module Accounts
  class DeleteOrders < ApplicationOperation
    def model!(params)
      Account.where(id: params[:id]).first
    end

    def process(params)
      model.orders.destroy_all if model && !Rails.env.production?
    end
  end
end

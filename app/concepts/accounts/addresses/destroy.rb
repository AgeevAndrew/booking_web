# frozen_string_literal: true

module Accounts::Addresses
  class Destroy < ApplicationOperation
    representer AddressRepresenter

    def model!(params)
      Account.find params[:account_id]
    end

    def process(params)
      model.address_ids.delete params[:id]
      model.save
      Address.destroy params[:id]
    end
  end
end

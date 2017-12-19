# frozen_string_literal: true

module Accounts::Addresses
  class Create < ApplicationOperation
    contract ::Accounts::Addresses::Forms::CreateForm

    representer AddressRepresenter

    def model!(*)
      Address.new
    end

    def process(params)
      validate(params) do
        contract.save
        update_account
      end
    end

    private

    def update_account
      account.address_ids << model.id
      account.save
    end

    def account
      @account ||= Account.find(@params[:account_id])
    end
  end
end

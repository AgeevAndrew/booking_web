# frozen_string_literal: true

module Accounts::Addresses
  class Update < ApplicationOperation
    contract ::Accounts::Addresses::Forms::CreateForm

    representer AddressRepresenter

    def model!(params)
      Address.find params[:id]
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end

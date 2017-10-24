# frozen_string_literal: true

module Accounts::Addresses
  class Update < ApplicationOperation
    contract ::Accounts::Addresses::Forms::CreateForm

    representer AccountRepresenter

    def model!(params)
      Address.find params[:id]
    end

    def process(params)
      validate(params[:address]) do
        contract.save
      end
    end
  end
end

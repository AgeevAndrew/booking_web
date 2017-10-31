# frozen_string_literal: true

module Accounts::Addresses
  class Create < ApplicationOperation
    contract ::Accounts::Addresses::Forms::CreateForm

    representer AccountRepresenter

    def model!(params)
      Account.find params[:account_id]
    end

    def process(params)
      validate(params) do
        model.address_ids << address_id
        model.save
      end
    end

    def contract!(*)
      @contract ||= self.class.contract_class.new(Address.new)
    end

    private

    def address_id
      Address.create(
        title: contract.title,
        city: contract.city,
        street: contract.street,
        house: contract.house,
        office: contract.office,
        entrance: contract.entrance,
        floor: contract.floor,
        code: contract.code,
      ).id
    end
  end
end

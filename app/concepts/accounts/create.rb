# frozen_string_literal: true

module Accounts
  class Create < ApplicationOperation
    contract Forms::CreateForm

    representer AccountRepresenter

    def model!(*)
      Account.new
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end

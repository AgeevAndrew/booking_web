# frozen_string_literal: true

module Accounts::Devices
  class RegisterDevice < ApplicationOperation
    contract ::Accounts::Devices::Forms::CreateForm

    representer DeviceRepresenter

    def model!(params)
      Device.find_or_initialize_by(account_id: params[:id],company_id: params[:company_id])
    end

    def process(params)
      validate(params) do
        contract.save
      end
    end
  end
end

# frozen_string_literal: true

module Accounts::Devices::Forms
  class CreateForm < Reform::Form
    include Reform::Form::ActiveRecord
    model ::Device

    property :device_type
    property :registration_token
    property :company_id
    property :account_id

    validates :device_type, :registration_token, :company_id, :account_id, presence: true
  end
end

# frozen_string_literal: true

require 'disposable/twin/property/hash'

module Accounts::Forms
  class CreateForm < Reform::Form
    include Disposable::Twin::Property::Hash
    model Account

    property :name
    property :phone
    property :email

    def phone=(value)
      super Phone.normalize(value)
    end

    validates :name, :phone, :email, presence: true

    validates :phone, format: { with: Phone::REGEX }
  end
end

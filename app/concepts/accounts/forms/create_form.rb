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

    collection :addresses, field: :hash, populate_if_empty: Hash do
      property :title
      property :city
      property :street
      property :house
      property :office
      property :floor
      property :code

      validates :title, :city, :street, :house, presence: true
    end

    validates :name, :phone, :email, presence: true

    validates :phone, format: { with: Phone::REGEX }
  end
end

# frozen_string_literal: true

module Accounts::Forms
  class CreateForm < Reform::Form
    model Account

    property :name
    property :phone
    property :email

    collection :addresses, populate_if_empty: Hash do
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
  end
end

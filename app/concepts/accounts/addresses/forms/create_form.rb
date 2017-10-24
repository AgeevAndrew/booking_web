# frozen_string_literal: true

module Accounts::Addresses::Forms
  class CreateForm < Reform::Form
    model ::Address

    property :title
    property :city
    property :street
    property :house
    property :office
    property :entrance
    property :floor
    property :code

    validates :title, :city, :street, :house, presence: true
  end
end

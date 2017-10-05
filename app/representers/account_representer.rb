# frozen_string_literal: true

class AccountRepresenter < ApplicationRepresenter
  property :name
  property :phone
  property :email
  collection :addresses do
    property :title
    property :city
    property :street
    property :house
    property :office
    property :floor
    property :code
  end
end

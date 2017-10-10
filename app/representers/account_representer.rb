# frozen_string_literal: true

class AccountRepresenter < ApplicationRepresenter
  property :name
  property :phone
  property :email
  collection :addresses
end

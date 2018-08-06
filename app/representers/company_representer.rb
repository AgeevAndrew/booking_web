# frozen_string_literal: true

class CompanyRepresenter < ApplicationRepresenter
  property :id
  property :name
  property :categories
  property :description
  property :contact_info
  property :delivery
  property :created_at
  property :updated_at
  collection :address_ids
end

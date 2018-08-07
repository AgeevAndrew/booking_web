# frozen_string_literal: true

class TidingRepresenter < ApplicationRepresenter
  property :id
  property :category
  property :company_id
  property :title
  property :body
  property :message
  property :active
end

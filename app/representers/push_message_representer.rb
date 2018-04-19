# frozen_string_literal: true

class PushMessageRepresenter < ApplicationRepresenter
  property :id
  property :company_id
  property :title
  property :body
  property :success
  property :failure
  property :created_at
end

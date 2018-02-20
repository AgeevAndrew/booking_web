# frozen_string_literal: true

class Api::CompanyRepresenter < ApplicationRepresenter
  property :id
  property :name
  property :categories
  property :description
  property :contact_info
  property :delivery
  property :created_at
  property :updated_at

  collection :addresses
  collection :schedules, decorator: CompanyScheduleRepresenter
end

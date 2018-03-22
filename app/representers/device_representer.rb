# frozen_string_literal: true

class DeviceRepresenter < ApplicationRepresenter
  property :id
  property :registration_token
  property :device_type
  property :company_id
end

# frozen_string_literal: true

class CompanyScheduleRepresenter < ApplicationRepresenter
  property :id
  property :company_id
  property :week_day
  property :time_start
  property :time_end
end

# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :schedules, class_name: 'CompanySchedule'
end

# frozen_string_literal: true

FactoryGirl.define do
  factory :company_schedule do
    association :company
    week_day "mon"
    time_start "09:00+10"
    time_end "18:00+10"
  end
end

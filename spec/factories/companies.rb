# frozen_string_literal: true

FactoryGirl.define do
  factory :company do
    name Faker::Company.name
    categories []
    description Faker::Company.catch_phrase
  end
end

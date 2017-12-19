# frozen_string_literal: true

FactoryGirl.define do
  factory :category do
    name Faker::Lorem.word
    icon_type Faker::Lorem.word
    description Faker::Lorem.sentence
  end
end

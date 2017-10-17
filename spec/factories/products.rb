# frozen_string_literal: true

FactoryGirl.define do
  factory :product do
    association :category
    association :company
    title Faker::Food.dish
    description Faker::Lorem.sentence
    photo Faker::Internet.url
    main_options do
      [
        { name: Faker::Food.unique.measurement, cost: Faker::Number.unique.number(2) },
        { name: Faker::Food.unique.measurement, cost: Faker::Number.unique.number(2) },
      ]
    end
    additional_info do
      [
        { name: Faker::Food.unique.ingredient, cost: Faker::Number.unique.number(2) },
        { name: Faker::Food.unique.ingredient, cost: Faker::Number.unique.number(2) },
      ]
    end
  end
end

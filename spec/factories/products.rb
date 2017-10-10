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
        {
          Faker::Food.unique.measurement => Faker::Number.unique.number(2),
          Faker::Food.unique.measurement => Faker::Number.unique.number(2),
        },
      ]
    end
    additional_info do
      {
        Faker::Food.unique.ingredient => Faker::Number.unique.number(2),
        Faker::Food.unique.ingredient => Faker::Number.unique.number(2),
      }
    end
  end
end

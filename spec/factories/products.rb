# frozen_string_literal: true

FactoryGirl.define do
  factory :product do
    association :category
    association :company
    title Faker::Food.dish
    brief Faker::Lorem.sentence(3, true, 4)
    description Faker::Lorem.paragraph
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

    trait :actived do
      active true
    end

    trait :deactived do
      active false
    end
  end
end

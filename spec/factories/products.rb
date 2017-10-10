# frozen_string_literal: true

FactoryGirl.define do
  factory :product do
    association :category
    association :company
    title Faker::Lorem.word
    description Faker::Lorem.sentence
    photo Faker::Internet.url
    main_options do
      [
        {
          Faker::Lorem.word => Faker::Number.number(2),
        },
      ]
    end
    additional_info { {} }
  end
end

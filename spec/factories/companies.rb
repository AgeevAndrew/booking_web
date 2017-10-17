# frozen_string_literal: true

FactoryGirl.define do
  factory :company do
    name Faker::Company.name
    categories [Faker::Number.between(1, 10), Faker::Number.between(11, 20), Faker::Number.between(21, 30)]
    description Faker::Company.catch_phrase
    contact_info do
      {
        'phone' => Faker::PhoneNumber.cell_phone,
        'address' => Faker::Address.street_address,
        'web' => Faker::Internet.url,
        'email' => Faker::Internet.email,
      }
    end
  end
end

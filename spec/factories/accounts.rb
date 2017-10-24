# frozen_string_literal: true

FactoryGirl.define do
  factory :account do
    id { SecureRandom.uuid }
    name Faker::Name.name_with_middle
    phone Faker::PhoneNumber.cell_phone
    email Faker::Internet.email
    addresses do
      [
        {
          title: Faker::Space.unique.galaxy, city: Faker::Address.unique.city, street: Faker::Address.unique.street_name,
          house: Faker::Address.unique.building_number, office: Faker::Number.unique.number(2),
          entrance: Faker::Number.number(1), floor: Faker::Number.unique.number(1), code: Faker::Number.unique.number(2)
        },
        {
          title: Faker::Space.unique.galaxy, city: Faker::Address.unique.city, street: Faker::Address.unique.street_name,
          house: Faker::Address.unique.building_number, office: Faker::Number.unique.number(2),
          entrance: Faker::Number.number(1), floor: Faker::Number.unique.number(1), code: Faker::Number.unique.number(2)
        },
      ]
    end
  end
end

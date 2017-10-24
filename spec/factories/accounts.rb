# frozen_string_literal: true

FactoryGirl.define do
  factory :account do
    id { SecureRandom.uuid }
    name Faker::Name.name_with_middle
    phone Faker::PhoneNumber.cell_phone
    email Faker::Internet.email

    trait :with_addresses do
      address_ids do
        [
          create(:address).id,
          create(:address).id,
        ]
      end
    end
  end
end

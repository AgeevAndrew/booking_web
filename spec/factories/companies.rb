# frozen_string_literal: true

FactoryGirl.define do
  factory :company do
    name Faker::Company.name
    categories [Faker::Number.between(1, 10), Faker::Number.between(11, 20), Faker::Number.between(21, 30)]
    description Faker::Company.catch_phrase
    delivery do
      {
        'cost' => Faker::Number.number(3).to_i,
        'free_shipping' => Faker::Number.number(3).to_i,
        'pickup_discount' => Faker::Number.number(1).to_i,
        'period' => { 'start' => '09:00', 'end' => '18:00' },
      }
    end
    contact_info do
      {
        'phone' => Faker::PhoneNumber.cell_phone,
        'address' => Faker::Address.street_address,
        'web' => Faker::Internet.url,
        'email' => Faker::Internet.email,
      }
    end

    trait(:free_shipping) do
      after(:build) { |company| company.delivery['free_shipping'] = 0 }
    end

    trait(:delivery) do
      transient do
        cost Faker::Number.number(3).to_i
        free_shipping Faker::Number.number(3).to_i
        pickup_discount Faker::Number.number(1).to_i
        period { { 'start' => '09:00', 'end' => '18:00' } }
      end

      delivery do
        { 'cost' => cost, 'free_shipping' => free_shipping, 'pickup_discount' => pickup_discount, 'period' => period }
      end
    end
  end
end

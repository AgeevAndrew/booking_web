# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email

    password Faker::Lorem.characters(10)
    password_confirmation { password }

    confirmed_at Faker::Date.backward(2)
  end
end

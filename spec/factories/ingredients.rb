# frozen_string_literal: true

FactoryGirl.define do
  factory :ingredient, class: Hash do
    name Faker::Food.ingredient
    qty Faker::Number.number(1)

    initialize_with { attributes }
  end
end

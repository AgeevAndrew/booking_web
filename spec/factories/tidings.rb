FactoryGirl.define do
  factory :tiding do
    category Tiding.categories.key(1)
    association :company
    title Faker::Lorem.sentence
    body Faker::Lorem.sentence
    message Faker::Lorem.sentence
    active 1
  end
end

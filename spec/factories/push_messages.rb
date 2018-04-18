FactoryGirl.define do
  factory :push_message do
    association(:company)
    title Faker::Lorem.sentence
    body Faker::Lorem.sentence
    success Faker::Number.number(2).to_i
    failure Faker::Number.number(2).to_i
  end
end

FactoryGirl.define do
  factory :status do
    name Faker::Lorem.word
    position 1

    trait(:new) { id Statuses::NEW }
    trait(:accepted) { id Statuses::ACCEPTED }
    trait(:cancelled) { id Statuses::CANCELLED }
  end
end

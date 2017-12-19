FactoryGirl.define do
  factory :status do
    name Faker::Lorem.word
    position 1

    trait(:new) do
      id Statuses::NEW
      name 'New'
    end

    trait(:accepted) do
      id Statuses::ACCEPTED
      name 'Accepted'
    end

    trait(:cancelled) do
      id Statuses::CANCELLED
      name 'Cancelled'
    end
  end
end

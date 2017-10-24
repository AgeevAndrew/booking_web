FactoryGirl.define do
  factory :address do
    title Faker::Space.galaxy
    city Faker::Address.unique.city
    street Faker::Address.unique.street_name
    house Faker::Address.unique.building_number
    office Faker::Number.unique.number(2)
    entrance Faker::Number.unique.number(1)
    floor Faker::Number.unique.number(1)
    code { office }
  end
end

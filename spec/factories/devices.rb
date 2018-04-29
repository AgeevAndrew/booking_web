FactoryGirl.define do
  factory :device do
    device_type Faker::Lorem.word
    registration_token Faker::Crypto.md5
    association :company
    association :account
  end
end

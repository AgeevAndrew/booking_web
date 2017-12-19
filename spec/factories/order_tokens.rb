# frozen_string_literal: true

FactoryGirl.define do
  factory :order_token do
    association :order
    token SecureRandom.uuid
  end
end

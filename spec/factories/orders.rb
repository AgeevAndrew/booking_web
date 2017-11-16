# frozen_string_literal: true

FactoryGirl.define do
  factory :order do
    association(:company)
    association :account, factory: [:account, :with_addresses]
    total_cost "9.99"
    delivery_time Time.current
    pickup false
    association :status, factory: [:status, :new]

    after(:build) do |order|
      order.address_info = order.account.addresses[0].to_json
    end

    trait :with_products do
      after(:create) do |order|
        create_list(:order_product, 2, order: order)
      end
    end
  end
end

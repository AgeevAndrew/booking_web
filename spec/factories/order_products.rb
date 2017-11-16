# frozen_string_literal: true

FactoryGirl.define do
  factory :order_product do
    association(:product)
    association :order
    qty Faker::Number.number(1).to_i
    total_cost '9.99'

    ingredients { [] }

    after(:build) do |op|
      op.main_option = op.product.main_options.sample['name']
    end
  end
end

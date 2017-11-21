# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Orders', acceptance: true do
  get '/api/orders' do
    let!(:account) { create(:account, :with_addresses) }
    let(:account_id) { account.id }

    let!(:order) { create(:order, :with_products, account: account) }

    parameter :account_id, required: true

    example 'Index' do
      do_request
      expect(status).to eq(200)
    end
  end

  post '/api/orders' do
    let!(:company) { create(:company) }
    let!(:account) { create(:account, :with_addresses) }
    let!(:product) { create(:product, company: company) }
    let!(:order_status) { create(:status, :new) }

    let(:company_id) { company.id }
    let(:account_id) { account.id }
    let(:address_id) { account.address_ids[0] }
    let(:time_start) { Time.parse(company.delivery['period']['start']) }
    let(:time_end) { Time.parse(company.delivery['period']['end']) }
    let(:delivery_time) do
      rand(time_start..time_end)
    end
    let(:pickup) { true }
    let(:product_id) { product.id }
    let(:main_option) { product.main_options[0]['name'] }
    let(:qty) { 1 }
    let(:ingredient_name) { product.additional_info[0]['name'] }

    let(:order_products) do
      [
        product_id: product_id,
        main_option: main_option,
        qty: qty,
        ingredients: [
          qty: qty,
          name: ingredient_name,
        ],
      ]
    end

    parameter :company_id, required: true
    parameter :account_id, required: true
    parameter :address_id, required: true
    parameter :delivery_time, required: true
    parameter :pickup
    parameter :order_products, required: true

    example 'Create' do
      do_request
      expect(status).to eq(201)
    end

    example 'Create (errors)' do
      do_request(locale: 'ru', company_id: nil, account_id: nil)
      expect(status).to eq(422)
    end
  end

  post '/api/orders/:id/accept' do
    parameter :id, required: true

    let(:id) { create(:order, :with_products).id }
    let!(:new_status) { create(:status, :accepted) }

    example 'Accept' do
      do_request
      expect(status).to eq(201)
    end
  end

  post '/api/orders/:id/cancel' do
    parameter :id, required: true

    let(:id) { create(:order, :with_products).id }
    let!(:new_status) { create(:status, :cancelled) }

    example 'Cancel' do
      do_request
      expect(status).to eq(201)
    end
  end
end

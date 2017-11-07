# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Address', acceptance: true do
  post '/api/accounts/:account_id/addresses' do
    parameter :account_id, required: true

    parameter :title, required: true
    parameter :city, required: true
    parameter :street,  required: true
    parameter :house, required: true
    parameter :office
    parameter :floor
    parameter :entrance
    parameter :code

    let(:account_id) { create(:account).id }
    let(:title) { Faker::Lorem.word }
    let(:city) { Faker::Address.city }
    let(:street) { Faker::Address.street_name }
    let(:house) { Faker::Address.building_number }
    let(:office) { Faker::Number.number(2) }
    let(:floor) { Faker::Number.number(1) }
    let(:entrance) { Faker::Number.between(1, 4) }
    let(:code) { office }

    example 'Create' do
      do_request
      expect(status).to eq(201)
    end

    example 'Create (errors)' do
      do_request(title: nil, street: nil)
      expect(status).to eq(422)
    end
  end

  patch '/api/accounts/:account_id/addresses/:id' do
    parameter :account_id, required: true
    parameter :id, required: true

    parameter :title, required: true
    parameter :city, required: true
    parameter :street, required: true
    parameter :house, required: true
    parameter :office
    parameter :floor
    parameter :entrance
    parameter :code

    let(:account) { create(:account, :with_addresses) }
    let(:account_id) { account.id }
    let(:id) { account.address_ids.sample }

    let(:title) { Faker::Lorem.word }
    let(:city) { Faker::Address.city }
    let(:street) { Faker::Address.street_name }
    let(:house) { Faker::Address.building_number }
    let(:office) { Faker::Number.number(2) }
    let(:floor) { Faker::Number.number(1) }
    let(:entrance) { Faker::Number.between(1, 4) }
    let(:code) { office }

    example 'Update' do
      do_request
      expect(status).to eq(204)
    end

    example 'Update (errors)' do
      do_request(title: nil, street: nil)
      expect(status).to eq(422)
    end
  end

  delete '/api/accounts/:account_id/addresses/:id' do
    parameter :account_id, required: true
    parameter :id, required: true

    let(:account) { create(:account, :with_addresses) }
    let(:account_id) { account.id }
    let(:id) { account.address_ids.sample }

    example 'Destroy' do
      do_request
      expect(status).to eq(204)
    end
  end
end

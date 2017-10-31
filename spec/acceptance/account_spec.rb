# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Account', acceptance: true do
  get '/api/accounts/:id' do
    parameter :id

    let(:id) { create(:account).id }

    example 'Show' do
      do_request
      expect(status).to eq(200)
    end

    example 'Show (not found)' do
      do_request(id: SecureRandom.uuid)
      expect(status).to eq(404)
    end
  end

  post '/api/accounts' do
    parameter :name, required: true
    parameter :email, required: true
    parameter :phone, required: true

    # default_params
    let(:name) { Faker::Name.name_with_middle }
    let(:phone) { Faker::PhoneNumber.phone_number }
    let(:email) { Faker::Internet.email }

    example 'Create' do
      do_request
      expect(status).to eq(201)
    end

    example 'Create (errors)' do
      do_request(name: nil, addresses: [{ title: nil }])
      expect(status).to eq(422)
    end
  end

  post '/api/accounts/:id/update' do
    parameter :id, required: true
    parameter :name, required: true
    parameter :email, required: true
    parameter :phone, required: true

    let(:id) { create(:account).id }

    # default_params
    let(:name) { Faker::Name.name_with_middle }
    let(:phone) { Faker::PhoneNumber.phone_number }
    let(:email) { Faker::Internet.email }

    example 'Update' do
      do_request
      expect(status).to eq(201)
    end

    example 'Update (errors)' do
      do_request(name: nil, addresses: [{ title: nil }])
      expect(status).to eq(422)
    end
  end

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

    example 'Add address' do
      do_request
      expect(status).to eq(201)
    end

    example 'Add address (errors)' do
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

    example 'Update address' do
      do_request
      expect(status).to eq(204)
    end

    example 'Update address (errors)' do
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

    example 'Destroy address' do
      do_request
      expect(status).to eq(204)
    end
  end
end

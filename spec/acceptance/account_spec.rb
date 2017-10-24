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
end

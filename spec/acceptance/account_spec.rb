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
    parameter :id, required: true
    parameter :name, required: true
    parameter :email, required: true
    parameter :phone, required: true

    # default_params
    let(:id) { SecureRandom.uuid }
    let(:name) { Faker::Name.name_with_middle }
    let(:phone) { Faker::PhoneNumber.phone_number }
    let(:email) { Faker::Internet.email }

    example 'Create' do
      do_request
      expect(status).to eq(201)
    end

    example 'Create (errors)' do
      do_request(name: nil)
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
      do_request(name: nil)
      expect(status).to eq(422)
    end
  end

  post '/api/accounts/:id/register_device' do
    parameter :id, required: true
    parameter :company_id, required: true
    parameter :device_type, required: true
    parameter :registration_token, required: true

    # default_params
    let(:id) { create(:account).id }
    let(:company_id) { create(:company).id }
    let(:device_type) { Faker::Lorem.word }
    let(:registration_token) { Faker::Crypto.md5 }

    example 'Register device' do
      do_request
      expect(status).to eq(201)
    end

    example 'Register device (errors)' do
      do_request(registration_token: nil)
      expect(status).to eq(422)
    end
  end

  delete '/api/accounts/:id' do
    parameter :id, required: true

    let(:id) { create(:account).id }

    example_request 'Delete' do
      expect(status).to eq 204
    end

    example 'Delete (not found)' do
      do_request(id: SecureRandom.uuid)
      expect(status).to eq(404)
    end
  end
end

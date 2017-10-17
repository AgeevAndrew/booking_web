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
    parameter :addresses, required: true

    let(:addresses) do
      [
        {
          title: title,
          city: city,
          street: street,
          house: house,
          office: office,
          floor: floor,
          code: code,
        },
      ]
    end

    # default_params
    let(:name) { Faker::Name.name_with_middle }
    let(:phone) { Faker::PhoneNumber.phone_number }
    let(:email) { Faker::Internet.email }
    let(:title) { Faker::Lorem.word }
    let(:city) { Faker::Address.city }
    let(:street) { Faker::Address.street_name }
    let(:house) { Faker::Address.building_number }
    let(:office) { Faker::Number.number(2) }
    let(:floor) { Faker::Number.number(1) }
    let(:code) { office }

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
    parameter :addresses, required: true

    let(:id) { create(:account).id }

    let(:addresses) do
      [
        {
          title: title,
          city: city,
          street: street,
          house: house,
          office: office,
          floor: floor,
          code: code,
        },
      ]
    end

    # default_params
    let(:name) { Faker::Name.name_with_middle }
    let(:phone) { Faker::PhoneNumber.phone_number }
    let(:email) { Faker::Internet.email }
    let(:title) { Faker::Lorem.word }
    let(:city) { Faker::Address.city }
    let(:street) { Faker::Address.street_name }
    let(:house) { Faker::Address.building_number }
    let(:office) { Faker::Number.number(2) }
    let(:floor) { Faker::Number.number(1) }
    let(:code) { office }

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

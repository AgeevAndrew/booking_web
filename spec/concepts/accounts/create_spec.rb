# frozen_string_literal: true

require 'rails_helper'

module Accounts
  RSpec.describe Create do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let(:model) { Account.new }

    let(:params) do
      {
        name: name,
        phone: phone,
        email: email,
        addresses: [{
          title: title,
          city: city,
          street: street,
          house: house,
          office: office,
          floor: floor,
          code: code,
        }],
      }
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

    describe '#result!' do
      subject { result }

      it { expect { operation_run }.to change { Account.count }.by(1) }
      it { expect(contract_class).to be < Forms::CreateForm }

      context 'success' do
        it { should be true }
      end

      context 'fail' do
        let(:name) { nil }
        it { should be false }
      end
    end
  end
end

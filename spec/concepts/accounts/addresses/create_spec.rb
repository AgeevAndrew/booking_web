# frozen_string_literal: true

require 'rails_helper'

module Accounts::Addresses
  RSpec.describe Create do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let!(:model) { create(:account, :with_addresses) }

    let(:params) do
      {
        account_id: model.id,
        address: {
          title: title,
          city: city,
          street: street,
          house: house,
          office: office,
          entrance: entrance,
          floor: floor,
          code: code,
        }
      }
    end

    # default_params
    let(:title) { Faker::Lorem.word }
    let(:city) { Faker::Address.city }
    let(:street) { Faker::Address.street_name }
    let(:house) { Faker::Address.building_number }
    let(:office) { Faker::Number.number(2) }
    let(:entrance) { Faker::Number.number(1) }
    let(:floor) { Faker::Number.number(1) }
    let(:code) { office }

    describe '#result!' do
      subject { result }

      it { expect { operation_run }.to change { Address.count }.by(1) }
      it { expect(contract_class).to be < Forms::CreateForm }

      context 'success' do
        it { should be true }
        it { expect(operation.model.reload.address_ids).to include Address.last.id }
      end

      context 'fail' do
        let(:title) { nil }
        it { should be false }
      end
    end
  end
end

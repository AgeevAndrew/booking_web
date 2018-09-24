# frozen_string_literal: true

require 'rails_helper'

module Accounts::Addresses
  RSpec.describe Update do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let!(:account) { create(:account, :with_addresses) }
    let(:id) { account.address_ids.sample }

    let(:params) do
      {
        account_id: account.id,
        id: id,
        title: title,
        city: city,
        street: street,
        house: house,
        office: office,
        entrance: entrance,
        floor: floor,
        code: code,
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
      it { expect { operation_run }.not_to change { Address.count } }
      it { expect(contract_class).to be < Forms::CreateForm }

      context 'success' do
        it { expect(result).to eq true }
        it { expect(operation.model.reload.title).to eq title }
        it { expect(operation.model.reload.city).to eq city }
        it { expect(operation.model.reload.street).to eq street }
        it { expect(operation.model.reload.house).to eq house }
        it { expect(operation.model.reload.office).to eq office }
        it { expect(operation.model.reload.entrance).to eq entrance }
        it { expect(operation.model.reload.floor).to eq floor }
        it { expect(operation.model.reload.code).to eq code }
      end

      context 'fail' do
        let(:city) { nil }
        it { expect(result).to eq false }
      end
    end
  end
end

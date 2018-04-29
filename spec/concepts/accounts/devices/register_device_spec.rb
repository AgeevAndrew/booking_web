# frozen_string_literal: true

require 'rails_helper'

module Accounts::Devices
  RSpec.describe RegisterDevice do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let!(:account) { create(:account) }
    let(:model) { Device.new }

    let(:params) do
      {
        device_type: device_type,
        registration_token: registration_token,
        company_id: company_id,
        id: account_id,
      }
    end

    # default_params
    let(:company_id) { create(:company).id }
    let(:account_id) { account.id }
    let(:device_type) { Faker::Lorem.word }
    let(:registration_token) { Faker::Crypto.md5 }

    describe '#result!' do
      subject { result }

      it { expect { operation_run }.to change { Device.count }.by(1) }
      it { expect(contract_class).to be < Forms::CreateForm }

      context 'success' do
        it { should be true }
        it { expect(operation.model.reload.id).to eq Device.last.id }
        it do
          operation_run
          expect(account.reload.devices).to include Device.last
        end
      end

      context 'fail' do
        let(:registration_token) { nil }
        it { should be false }
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

module Accounts::Addresses
  RSpec.describe Destroy do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let!(:model) { create(:account, :with_addresses) }
    let(:id) { model.address_ids.sample }

    let(:params) do
      {
        account_id: model.id,
        id: id,
      }
    end

    describe '#result!' do
      subject { result }

      it { expect { operation_run }.to change { Address.count }.by(-1) }

      context 'success' do
        it { should be true }
        it { expect(operation.model.reload.address_ids).not_to include id }
      end
    end
  end
end

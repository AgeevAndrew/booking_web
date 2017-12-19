# frozen_string_literal: true

require 'rails_helper'

module Accounts
  RSpec.describe Update do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let!(:model) { create(:account) }

    let(:params) do
      {
        id: id,
        name: name,
        phone: phone,
        email: email,
      }
    end

    # default_params
    let(:id) { model.id }
    let(:name) { Faker::Name.name_with_middle }
    let(:phone) { Faker::PhoneNumber.phone_number }
    let(:email) { Faker::Internet.email }

    describe '#result!' do
      subject { result }

      it { expect { operation_run }.not_to change { Account.count } }
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

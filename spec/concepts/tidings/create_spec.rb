# frozen_string_literal: true

require 'rails_helper'

module Tidings
  RSpec.describe Create do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let(:current_user) { create(:user) }
    let(:company_id) { user.company_id }
    let(:category) { 'promotions' }
    let(:default_params) do
      {
        current_user: current_user,
        category: category,
        title: title,
        body: body,
        message: message,
      }
    end

    let(:title) { Faker::Lorem.sentence }
    let(:body) { Faker::Lorem.sentence }
    let(:message) { Faker::Lorem.sentence }

    describe '#result!' do
      let(:params) { default_params }

      it { expect { operation_run }.to change { Tiding.count }.by(1) }
      it { expect(contract_class).to be < Forms::CreateForm }

      context 'success' do
        it { expect(result).to eq true }
        it { expect(operation.model.reload.company_id).to eq current_user.company_id }
        it { expect(operation.model.reload.category).to eq category }
        it { expect(operation.model.reload.title).to eq title }
        it { expect(operation.model.reload.body).to eq body }
        it { expect(operation.model.reload.message).to eq message }
        it { expect(operation.model.reload.active).to eq 'on' }
      end

      context 'Another company' do
        let(:params) { default_params.merge(company_id: create(:company).id) }

        it { expect(result).to eq true }
        it { expect(operation.model.reload.company_id).to eq current_user.company_id }
      end

      context 'Invalid category' do
        let(:category) { 1 }
        it { expect(result).to eq false }
      end
    end
  end
end

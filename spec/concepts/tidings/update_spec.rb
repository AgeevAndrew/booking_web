# frozen_string_literal: true

require 'rails_helper'

module Tidings
  RSpec.describe Update do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let(:company) { create(:company) }
    let!(:tiding) { create(:tiding, company: company) }
    let(:company_id) { company.id }
    let(:category) { Tiding.categories.key(1) }
    let(:id) { tiding.id }
    let(:params) do
      {
          id: id,
          company_id: company_id,
          category: category,
          title: title,
          body: body,
          message: message,
      }
    end

    let(:title) { Faker::Lorem.sentence }
    let(:body) { Faker::Lorem.sentence }
    let(:message) { Faker::Lorem.sentence }

    describe  '#result!' do
      it { expect { operation_run }.not_to change { Tiding.count } }
      it { expect(contract_class).to be < Forms::CreateForm }

      context 'success' do
        it { expect(result).to eq true }
        it { expect(operation.model.reload.company_id).to eq company.id }
        it { expect(operation.model.reload.category).to eq Tiding.categories.key(1) }
        it { expect(operation.model.reload.title).to eq title }
        it { expect(operation.model.reload.body).to eq body }
        it { expect(operation.model.reload.message).to eq message }
        it { expect(operation.model.reload.active).to eq Tiding.actives.key(1) }
      end

      context 'Invalid company' do
        let(:company_id) { nil }
        it { expect(result).to eq false }
      end

      context 'Invalid category' do
        let(:category) { 1 }
        it { expect(result).to eq false }
      end
    end
  end
end

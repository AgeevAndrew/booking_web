# frozen_string_literal: true

require 'rails_helper'

module Orders::Forms
  RSpec.describe CreateForm do
    let(:model) { Order.new }

    let(:params) do
      {
        company_id: company_id,
        account_id: account_id,
        address_name: address_name,
      }
    end

    let(:company) { create(:company) }
    let(:account) { create(:account) }

    let(:company_id) { company.id }
    let(:account_id) { account.id }
    let(:address_name) { account.addresses[0][:title] }

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    describe '#validate' do
      before { form_validate }
      subject do
        form.errors.messages
      end

      context 'company_id' do
        context 'blank' do
          let(:company_id) { nil }
          it { expect(subject[:company_id]).to include "can't be blank" }
        end
        context 'invalid' do
          let(:company_id) { company.id + 1 }
          it { expect(subject[:company_id]).to include "is invalid" }
        end
      end

      context 'account_id' do
        context 'blank' do
          let(:account_id) { nil }
          it { expect(subject[:account_id]).to include "can't be blank" }
        end
        context 'invalid' do
          let(:account_id) { SecureRandom.uuid }
          it { expect(subject[:account_id]).to include "is invalid" }
        end
      end

      context 'address_name' do
        context 'blank' do
          let(:address_name) { nil }
          it { expect(subject[:address_name]).to include "can't be blank" }
        end

        context 'invalid' do
          let(:address_name) { SecureRandom.uuid }
          it { expect(subject[:address_name]).to include "is invalid" }
        end
      end
    end
  end
end

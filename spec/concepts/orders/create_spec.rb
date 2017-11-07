# frozen_string_literal: true

require 'rails_helper'

module Orders
  RSpec.describe Create do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let(:model) { Order.new }

    let(:params) do
      {
        company_id: company_id,
        account_id: account_id,
        address_id: address_id,
        qty: qty,
        order_products: [{
          product_id: product_id,
          main_option: main_option,
          ingredients: [
            qty: qty,
            name: ingredient_name,
          ],
        }],
      }
    end

    let!(:company) { create(:company) }
    let!(:account) { create(:account, :with_addresses) }
    let!(:product) { create(:product, company: company) }

    let(:company_id) { company.id }
    let(:account_id) { account.id }
    let(:address_id) { account.address_ids[0] }
    let(:product_id) { product.id }
    let(:main_option) { product.main_options[0]['name'] }
    let(:qty) { 1 }
    let(:ingredient_name) { product.additional_info[0]['name'] }

    describe '#process' do
      it { expect(contract_class).to be < ::Orders::Forms::CreateForm }

      it { expect { operation_run }.to change { Order.count }.by(1) }
      it { expect { operation_run }.to change { OrderProduct.count }.by(1) }
      it { expect(result).to eq true }

      describe 'order attributes' do
        # before { operation_run }
        let(:result_cost) do
          qty * (product.main_options[0]['cost'].to_f + qty * product.additional_info[0]['cost'].to_f)
        end

        subject { operation.model.reload }

        it { expect(subject.company_id).to eq company_id }
        it { expect(subject.account_id).to eq account_id }
        it { expect(subject.total_cost).to eq result_cost }
        it { expect(subject.address_info).to eq Address.find(address_id).to_json }
      end

      describe 'products attributes' do
        let(:result_cost) do
          qty * (product.main_options[0]['cost'].to_f + qty * product.additional_info[0]['cost'].to_f)
        end

        subject { operation.model.reload.order_products.first }

        it { expect(subject.order_id).to eq Order.last.id }
        it { expect(subject.product_id).to eq product_id }
        it { expect(subject.main_option).to eq main_option }
        it { expect(subject.total_cost).to eq result_cost }
      end
    end
  end
end

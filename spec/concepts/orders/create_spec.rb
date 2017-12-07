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
        pickup: pickup,
        delivery_time: delivery_time,
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
    let!(:status) { create(:status, :new) }

    let(:company_id) { company.id }
    let(:account_id) { account.id }
    let(:address_id) { account.address_ids[0] }
    let(:product_id) { product.id }
    let(:main_option) { product.main_options[0]['name'] }
    let(:time_start) { Time.parse(company.delivery['period']['start']) }
    let(:time_end) { Time.parse(company.delivery['period']['end']) }
    let(:delivery_time) do
      rand(time_start..time_end)
    end
    let(:pickup) { false }
    let(:qty) { 1 }
    let(:ingredient_name) { product.additional_info[0]['name'] }

    describe '#process' do
      before do
        allow(NewOrderPropogateJob).to receive(:perform_later)
      end

      it { expect(contract_class).to be < ::Orders::Forms::CreateForm }

      it { expect { operation_run }.to change { Order.count }.by(1) }
      it { expect { operation_run }.to change { OrderProduct.count }.by(1) }
      it do
        operation_run
        expect(NewOrderPropogateJob).to have_received(:perform_later).with(Order.last.id)
      end
      it { expect(result).to eq true }

      describe 'order attributes' do
        # before { operation_run }
        subject { operation.model.reload }

        it { expect(subject.company_id).to eq company_id }
        it { expect(subject.account_id).to eq account_id }
        it { expect(subject.status_id).to eq Statuses::NEW }
        it { expect(subject.address_info['id']).to eq address_id }

        let(:result_cost) do
          qty * product.main_options[0]['cost'].to_f + qty * product.additional_info[0]['cost'].to_f
        end

        context 'delivery_cost' do
          context 'free_shipping' do
            let(:company) { create(:company, :free_shipping) }

            it { expect(subject.delivery_cost).to eq 0 }
          end

          context 'pickup' do
            let(:pickup) { true }
            it { expect(subject.delivery_cost).to eq 0 }
          end

          context 'full cost' do
            let(:company) { create(:company, :delivery, free_shipping: 1_000_000_000) }
            it { expect(subject.delivery_cost).to eq company.delivery['cost'] }
          end
        end

        context 'order_cost' do
          context 'full cost' do
            it { expect(subject.total_cost).to be_within(0.01).of(result_cost) }
          end

          context 'with pickup discount' do
            let(:pickup) { true }
            let(:discount) { 10 }
            let(:company) { create(:company, :delivery, pickup_discount: discount) }

            it { expect(subject.total_cost).to be_within(0.01).of(result_cost * (1 - discount / 100.0)) }
          end
        end
      end

      describe 'products attributes' do
        let(:result_cost) do
          qty * (product.main_options[0]['cost'].to_f + qty * product.additional_info[0]['cost'].to_f)
        end

        subject { operation.model.reload.order_products.first }

        it { expect(subject.order_id).to eq Order.last.id }
        it { expect(subject.product_id).to eq product_id }
        it { expect(subject.main_option).to eq main_option }
        it { expect(subject.total_cost).to be_within(0.01).of(result_cost) }
      end
    end
  end
end

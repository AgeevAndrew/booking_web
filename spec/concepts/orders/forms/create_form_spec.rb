# frozen_string_literal: true

require 'rails_helper'

module Orders::Forms
  RSpec.describe CreateForm do
    let(:model) { Order.new }

    let(:params) do
      {
        company_id: company_id,
        account_id: account_id,
        address_id: address_id,
        pickup: pickup,
        delivery_time: delivery_time,
        order_products: products,
      }
    end

    let(:company) { create(:company) }
    let(:account) { create(:account, :with_addresses) }

    let(:company_id) { company.id }
    let(:account_id) { account.id }
    let(:address_id) { account.address_ids[0] }
    let(:delivery_time) { Time.now }
    let(:pickup) { nil }
    let(:products) { nil }

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

      context 'delivery_time' do
        context 'blank' do
          let(:delivery_time) { nil }
          it { expect(subject[:delivery_time]).to include "can't be blank" }
        end

        context 'invalid' do
          let(:delivery_time) { Faker::Time.between(Time.zone.today, Time.zone.today, :midnight) }
          it { expect(subject[:delivery_time]).to include "is invalid" }
        end

        context 'valid time' do
          let(:time_start) { Time.parse(company.delivery['period']['start']) }
          let(:time_end) { Time.parse(company.delivery['period']['end']) }
          let(:delivery_time) do
            Faker::Time.between(time_start, time_end, :day)
          end

          it { expect(subject[:delivery_time]).not_to include 'is invalid' }
        end
      end

      context 'products' do
        let(:products) do
          [
            product1,
            product2,
          ]
        end

        let(:product1) do
          {
            product_id: product_id,
            main_option: product_main_option,
          }
        end

        let(:product2) do
          {
            product_id: product_id2,
            main_option: product_main_option2,
            ingredients: [ingredient1, ingredient2],
          }
        end

        # default params
        let(:product) { create(:product, company_id: company_id) }
        let(:product_id) { product.id }
        let(:product_main_option) { product.main_options[0]['name'] }

        let(:another_product) { create(:product, company_id: company_id) }
        let(:product_id2) { another_product.id }
        let(:product_main_option2) { another_product.main_options[1]['name'] }
        let(:ingredient1) { build(:ingredient, name: another_product.additional_info[0]['name']) }
        let(:ingredient2) { build(:ingredient, name: another_product.additional_info[1]['name']) }

        context 'product' do
          let(:product_id) { nil }
          it { expect(form.errors.messages[:"order_products.product_id"]).to eq ["can't be blank"] }

          context 'not exists' do
            let(:product_id) { -1 }
            it { expect(form.errors.messages[:"order_products.product_id"]).to eq ['is invalid'] }
          end
        end

        context 'main_option' do
          let(:product_main_option) { nil }
          it { expect(form.errors.messages[:"order_products.main_option"]).to eq(["can't be blank"]) }

          context 'not exists' do
            let(:product_main_option) { product.main_options[0]['name'] + Faker::Lorem.word }
            it { expect(form.errors.messages[:"order_products.main_option"]).to eq ['is invalid'] }
          end
        end

        context 'ingridients' do
          context 'qty' do
            let(:ingredient1) { build(:ingredient, qty: nil, name: another_product.additional_info[0]['name']) }
            it { expect(form.errors.messages[:"order_products.ingredients.qty"]).to eq ["can't be blank"] }
            it { expect(form.errors.messages[:"order_products.ingredients.name"]).not_to include 'is invalid' }
          end

          context 'name' do
            let(:ingredient2) { build(:ingredient, name: nil) }
            it { expect(form.errors.messages[:"order_products.ingredients.name"]).to eq ["can't be blank"] }

            context 'not exist in product' do
              let(:ingredient2) { build(:ingredient, name: Faker::Number.number(4)) }
              it { expect(form.errors.messages[:"order_products.ingredients.name"]).to eq ["is invalid"] }
            end
          end
        end
      end
    end
  end
end

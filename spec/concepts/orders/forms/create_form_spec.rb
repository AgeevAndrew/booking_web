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
        products: products,
      }
    end

    let(:company) { create(:company) }
    let(:account) { create(:account, :with_addresses) }

    let(:company_id) { company.id }
    let(:account_id) { account.id }
    let(:address_id) { account.address_ids[0] }
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

      context 'address_id' do
        context 'blank' do
          let(:address_id) { nil }
          it { expect(subject[:address_id]).to include "can't be blank" }
        end

        context 'invalid' do
          let(:address_id) { -1 }
          it { expect(subject[:address_id]).to include "is invalid" }
        end
      end

      context 'products' do
        let(:products) do
          [
            product1,
            # product2,
          ]
        end

        let(:product1) do
          {
            id: product_id,
            main_option: product_main_option,
            # ingridients: [],
          }
        end

        # let(:product2) do
        #   {
        #     id: product_id2,
        #     main_option: product_main_option2,
        #     ingridients: [
        #       qty: ingridient_qty,
        #       name: ingridient_name,
        #     ],
        #   }
        # end

        # default params
        let(:product) { create(:product, company_id: company_id) }
        let(:product_id) { product.id }
        let(:product_main_option) { product.main_options[0]['name'] }

        context 'id' do
          let(:product_id) { nil }
          it { ap params }
        end
      end
    end
  end
end

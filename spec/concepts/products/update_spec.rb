# frozen_string_literal: true

require 'rails_helper'

module Products
  RSpec.describe Update do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let!(:product) { create(:product) }

    let(:params) do
      {
        id: product.id,
        company_id: company_id,
        category_id: category_id,
        title: title,
        description: description,
        brief: brief,
        photo: photo,
        main_options: main_options,
        additional_info: additional_info,
        active: active,
      }
    end

    # default_params
    let(:company_id) { product.company_id }
    let(:category_id) { product.category_id }
    let(:title) { Faker::Food.dish }
    let(:description) { Faker::Lorem.paragraph }
    let(:brief) { Faker::Lorem.sentence(3, true, 4) }
    let(:photo) { Faker::Internet.url }
    let(:main_options) {
      [
        { 'cost' => Faker::Number.unique.number(2), 'name' => Faker::Food.unique.measurement },
        { 'cost' => Faker::Number.unique.number(2), 'name' => Faker::Food.unique.measurement },
      ]
    }
    let(:additional_info) {
      [
        { 'name' => Faker::Food.unique.ingredient, 'cost' => Faker::Number.unique.number(2) },
        { 'name' => Faker::Food.unique.ingredient, 'cost' => Faker::Number.unique.number(2) },
      ]
    }
    let(:active) { true }

    describe '#result!' do
      it { expect { operation_run }.not_to change { Product.count } }
      it { expect(contract_class).to be < Forms::UpdateForm }

      context 'success' do
        it { expect(result).to eq true }
        it { expect(operation.model.reload.company_id).to eq company_id }
        it { expect(operation.model.reload.category_id).to eq category_id }
        it { expect(operation.model.reload.title).to eq title }
        it { expect(operation.model.reload.description).to eq description }
        it { expect(operation.model.reload.brief).to eq brief }
        it { expect(operation.model.reload.photo).to eq photo }
        it { expect(operation.model.reload.main_options).to eq main_options }
        it { expect(operation.model.reload.additional_info).to eq additional_info }
        it { expect(operation.model.reload.active).to eq active }
      end

      context 'fail' do
        let(:title) { nil }
        it { expect(result).to eq false }
      end
    end
  end
end

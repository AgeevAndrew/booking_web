# frozen_string_literal: true

require 'rails_helper'

module Products::Forms
  RSpec.describe CreateForm do
    let(:model) { Product.new }

    let(:params) do
      {
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

    let(:company) { create(:company) }
    let(:category) { create(:category) }

    # default_params
    let(:company_id) { company.id }
    let(:category_id) { category.id }
    let(:title) { Faker::Food.dish }
    let(:description) { Faker::Lorem.paragraph }
    let(:brief) { Faker::Lorem.sentence(3, true, 4) }
    let(:photo) { Faker::Internet.url }
    let(:main_options) {
      [
        { name: Faker::Food.unique.measurement, cost: Faker::Number.unique.number(2) },
        { name: Faker::Food.unique.measurement, cost: Faker::Number.unique.number(2) },
      ]
    }
    let(:additional_info) {
      [
        { name: Faker::Food.unique.ingredient, cost: Faker::Number.unique.number(2) },
        { name: Faker::Food.unique.ingredient, cost: Faker::Number.unique.number(2) },
      ]
    }
    let(:active) { true }

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    describe '#validate' do
      before { form_validate }
      subject do
        form.errors.messages
      end

      %i[company_id category_id title description brief main_options].each do |field|
        context field.to_s do
          let(field) { nil }
          it { expect(subject[field]).to include "can't be blank" }
        end
      end
    end
  end
end

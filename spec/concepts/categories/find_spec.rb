# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categories::Find do
  let(:operation_run) { described_class.run(params) }
  let(:result) { operation_run[0] }
  let(:parsed_json) { JSON.parse(described_class.call(params).to_json) }

  let(:params) do
    {
      company_id: company.id,
    }
  end

  let(:company) { create(:company) }

  let(:product_actived) { create(:product, :actived, company: company) }
  let(:product_deactived) { create(:product, :deactived, company: company) }

  before { company.update(categories: [product_actived.category_id, product_deactived.category_id]) }

  describe '#result!' do
    subject { result }
    context 'success' do
      it { is_expected.to eq true }
    end

    context '' do
      subject { parsed_json["categories"] }

      let(:category) { product_actived.category }
      let(:deactivated_category) { product_deactived.category }

      it { is_expected.not_to eq [] }
      it { is_expected.to include(CategoryRepresenter.represent(category).as_json) }
      it { is_expected.not_to include(CategoryRepresenter.represent(deactivated_category).as_json) }

      context '' do
        let(:product_actived) { create(:product, :actived) }
        before { create(:product, :deactived, company: company, category: product_actived.category) }

        it { is_expected.not_to include(CategoryRepresenter.represent(category).as_json) }
      end
    end
  end
end

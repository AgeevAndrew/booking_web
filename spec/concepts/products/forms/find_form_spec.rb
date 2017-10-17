# frozen_string_literal: true

require 'rails_helper'

module Products::Forms
  RSpec.describe FindForm do
    let(:model) { nil }

    let(:params) do
      {
        company_id: company_id,
        category_id: category_id,
      }
    end

    let(:company_id) { nil }
    let(:category_id) { nil }

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    describe '#validate' do
      before { form_validate }
      subject do
        form.errors.messages
      end

      context 'company_id' do
        it { expect(subject[:company_id]).to be_blank }
      end

      context 'category_id' do
        it { expect(subject[:category_id]).to be_blank }
      end
    end
  end
end

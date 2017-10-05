# frozen_string_literal: true

require 'rails_helper'

module Products
  RSpec.describe Find do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }

    let(:params) do
      {
        company_id: company_id,
        category_id: category_id,
      }
    end

    let(:company_id) { Faker::Number.number(2) }
    let(:category_id) { Faker::Number.number(2) }

    describe '#result!' do
      subject { result }
      context 'success' do
        it { should be true }
      end

      context 'fail' do
        let(:company_id) { nil }
        it { should be false }
      end
    end
  end
end

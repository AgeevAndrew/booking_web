# frozen_string_literal: true

require 'rails_helper'

module Tidings
  RSpec.describe Index do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let(:company) { create(:company) }
    let!(:tiding) { create(:tiding, company: company) }
    let(:company_id) { company.id }
    let(:params) do
      {
          company_id: company_id
      }
    end

    describe  '#result!' do
      subject { result }

      context 'success' do
        it { should be true }
      end
    end
  end
end

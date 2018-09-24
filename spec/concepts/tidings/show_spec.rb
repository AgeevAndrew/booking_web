# frozen_string_literal: true

require 'rails_helper'

module Tidings
  RSpec.describe Show do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let(:company) { create(:company) }
    let!(:tiding) { create(:tiding, company: company) }
    let(:id) { tiding.id }
    let(:params) { { id: id } }

    describe  '#result!' do
      it { expect { operation_run }.not_to change { Tiding.count } }

      context 'success' do
        it { expect(result).to eq true }
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

module Orders
  RSpec.describe Accept do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }

    let!(:order) { create(:order) }
    let!(:accepted) { create(:status, :accepted) }

    let(:params) { { id: order.id } }

    describe '#process' do
      it { expect(result).to eq true }
      it { expect(operation.model.reload.status_id).to eq accepted.id }
    end
  end
end

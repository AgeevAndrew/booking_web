# frozen_string_literal: true

require 'rails_helper'

module Products
  RSpec.describe VisibilityChange do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }

    let(:model) { create(:product) }
    let(:active) { false }

    let(:params) do
      {
        id: model.id,
        active: active,
      }
    end

    describe '#process' do
      it { expect(result).to eq true }

      context 'false' do
        let(:model) { create(:product, active: true) }
        let(:active) { false }

        it { expect(operation.model.reload.active).to eq active }
      end

      context 'true' do
        let(:model) { create(:product, active: false) }
        let(:active) { true }

        it { expect(operation.model.reload.active).to eq active }
      end
    end
  end
end

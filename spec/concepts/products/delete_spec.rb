# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Products::Delete do
  let(:operation_run) { described_class.run(params) }
  let(:result) { operation_run[0] }
  let(:operation) { operation_run[1] }

  let(:params) { { id: id } }

  let(:id) { product.id }

  let(:product) { create(:product, :actived) }

  describe '#process' do
    it { expect(result).to eq true }
    it { expect(operation.model.deleted_at).not_to be_blank }
  end
end

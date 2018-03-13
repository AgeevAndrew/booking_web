# frozen_string_literal: true

require 'rails_helper'

module Orders
  RSpec.describe Filter do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }

    let(:params) { { current_user: current_user } }
    let(:current_user) { create(:user, company: order.company) }
    let(:order) { create(:order, :with_products) }

    describe '#present' do
      it { expect(result).to eq true }
    end
  end
end

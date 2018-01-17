# frozen_string_literal: true

require 'rails_helper'

module Products
  RSpec.describe Index do
    let(:user) { build(:user) }
    let(:operation_run) { described_class.run({ current_user: user }) }
    let(:result) { operation_run[0] }

    describe '#result!' do
      subject { result }
      context 'success' do
        it { should be true }
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Categories::Find do
  let(:operation_run) { described_class.run(params) }
  let(:result) { operation_run[0] }

  let(:params) do
    {
      company_id: company_id,
    }
  end

  let(:company_id) { create(:company).id }

  describe '#result!' do
    subject { result }
    context 'success' do
      it { should be true }
    end

    context 'fail' do
      let(:company_id) { nil }
      it { expect { operation_run }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end

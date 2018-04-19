# frozen_string_literal: true

require 'rails_helper'

module PushMessages
  RSpec.describe Create do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }
    let(:contract_class) { operation.contract.class }

    let!(:product) { create(:product) }

    let(:params) do
      {
        current_user: current_user,
        title: title,
        body: body,
      }
    end

    let(:success) { Faker::Number.number(2).to_i }
    let(:failure) { Faker::Number.number(2).to_i }

    # default_params
    let(:current_user) { create(:user) }
    let(:title) { Faker::Lorem.sentence }
    let(:body) { Faker::Lorem.sentence }

    describe '#result!' do
      before do
        use_case = instance_double(FMC::PushNotification)
        result = instance_double(FMC::Response::Push, success: success, failure: failure)
        allow(use_case).to receive(:result).and_return(result)
        allow(FMC::PushNotification).to receive(:perform).and_return(use_case)
      end
      it { expect { operation_run }.to change { PushMessage.count }.by(1) }
      it { expect(contract_class).to be < Forms::CreateForm }

      context 'success' do
        it { expect(result).to eq true }
        it { expect(operation.model.reload.company_id).to eq current_user.company_id }
        it { expect(operation.model.reload.title).to eq title }
        it { expect(operation.model.reload.body).to eq body }
        it { expect(operation.model.reload.success).to eq success }
        it { expect(operation.model.reload.failure).to eq failure }
      end

      context 'fail' do
        let(:title) { nil }
        it { expect(result).to eq false }
      end
    end
  end
end

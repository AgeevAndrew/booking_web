# frozen_string_literal: true

require 'rails_helper'

module Accounts::Devices::Forms
  RSpec.describe CreateForm do
    let(:model) { Device.new }

    let(:params) do
      {
        device_type: device_type,
        registration_token: registration_token,
        company_id: company_id,
        account_id: account_id,
      }
    end

    # default_params
    let!(:company_id) { create(:company).id }
    let!(:account_id) { create(:account).id }
    let(:device_type) { Faker::Lorem.word }
    let(:registration_token) { Faker::Crypto.md5 }

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    describe '#validate' do
      before { form_validate }
      subject do
        form.errors.messages
      end

      # context 'uniq account through company_id' do
      #   before { create(:device, account_id: account_id, company_id: company_id) }
      #   it { expect(subject).to include 'has already been taken' }
      # end

      %i[device_type registration_token company_id account_id].each do |field|
        context field.to_s do
          let(field) { nil }
          it { expect(subject[field]).to include "can't be blank" }
        end
      end
    end
  end
end

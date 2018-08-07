# frozen_string_literal: true

require 'rails_helper'

module Accounts::Forms
  RSpec.describe CreateForm do
    let(:model) { Account.new }

    let(:params) do
      {
        id: id,
        name: name,
        phone: phone,
        email: email,
      }
    end

    # default_params
    let(:name) { Faker::Name.name_with_middle }
    let(:phone) { Faker::PhoneNumber.phone_number }
    let(:email) { Faker::Internet.email }
    let(:id) { SecureRandom.uuid }

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    describe '#validate' do
      before { form_validate }
      subject do
        form.errors.messages
      end

      %i[id phone].each do |field|
        context field.to_s do
          let(field) { nil }
          it { expect(subject[field]).to include "can't be blank" }
        end
      end

      context 'phone pattern' do
        context 'invalid' do
          let(:phone) { Faker::PhoneNumber.cell_phone }

          it { expect(subject[:phone]).to include 'is invalid' }
        end

        context 'valid' do
          it { expect(subject[:phone]).not_to include 'is invalid' }
        end
      end

      context 'uuid pattern' do
        context 'invalid' do
          let(:id) { Faker::Number.number(2) }

          it { expect(subject[:id]).to include 'is invalid' }
        end

        context 'valid' do
          it { expect(subject[:id]).not_to include 'is invalid' }
        end
      end

      context 'uniq uuid' do
        let!(:account) { create(:account) }
        let(:id) { account.id }

        it { expect(subject[:id]).to include 'has already been taken' }
      end
    end
  end
end

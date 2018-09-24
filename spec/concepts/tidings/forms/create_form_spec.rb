# frozen_string_literal: true

require 'rails_helper'

module Tidings::Forms
  RSpec.describe CreateForm do
    let(:model) { Tiding.new(company_id: current_user.company_id, active: :on) }

    let(:params) do
      {
        company_id: company_id,
        category: category,
        title: title,
        body: body,
        message: message,
      }
    end

    let(:current_user) { create(:user) }
    let(:company) { create(:company) }
    let(:company_id) { company.id }
    let(:category) { Tiding.categories.key(1) }
    let(:title) { Faker::Lorem.sentence }
    let(:body) { Faker::Lorem.sentence }
    let(:message) { Faker::Lorem.sentence }

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    describe '#validate' do
      before { form_validate }
      subject do
        form.errors.messages
      end

      context 'company_id' do
        context 'blank' do
          let(:company_id) { nil }
          it { expect(subject[:company_id]).to include "can't be blank" }
        end
        context 'invalid' do
          let(:company_id) { company.id + 1 }
          it { expect(subject[:company_id]).to include "is invalid" }
        end
      end

      context 'category' do
        context 'blank' do
          let(:category) { nil }
          it { expect(subject[:category]).to include "can't be blank" }
        end
        context 'invalid' do
          let(:category) { 1 }
          it { expect(subject[:category]).to include "is not included in the list" }
        end
      end

    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

module PushMessages::Forms
  RSpec.describe CreateForm do
    let(:model) { PushMessage.new }

    let(:params) do
      {
        company_id: company_id,
        title: title,
        body: body,
        success: success,
        failure: failure,
      }
    end

    let(:company) { create(:company) }

    # default_params
    let(:company_id) { company.id }
    let(:title) { Faker::Lorem.sentence }
    let(:body) { Faker::Lorem.sentence }
    let(:success) { Faker::Number.number(2).to_i }
    let(:failure) { Faker::Number.number(2).to_i }

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    describe '#validate' do
      before { form_validate }
      subject do
        form.errors.messages
      end

      %i[company_id title body success failure].each do |field|
        context field.to_s do
          let(field) { nil }
          it { expect(subject[field]).to include "can't be blank" }
        end
      end
    end
  end
end

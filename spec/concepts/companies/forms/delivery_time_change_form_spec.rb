# frozen_string_literal: true

require 'rails_helper'

module Companies::Forms
  RSpec.describe DeliveryTimeChangeForm do
    let(:model) { create(:company_schedule) }

    let(:params) do
      {
        week_day: week_day,
        time_start: time_start,
        time_end: time_end,
      }
    end

    let(:form) { described_class.new(model) }
    let(:form_validate) { form.validate(params) }

    let(:week_day) { nil }
    let(:time_start) { nil }
    let(:time_end) { nil }

    describe '#validate' do
      before { form_validate }

      subject(:errors) { form.errors.messages }

      it { expect(errors[:time_start]).to include "can't be blank" }
      it { expect(errors[:time_end]).to include "can't be blank" }
      it { expect(errors[:week_day]).to include "can't be blank" }

      context 'week_day' do
        let(:week_day) { Faker::Lorem.word }

        it { expect(errors[:week_day]).to include "is not included in the list" }

        context 'valid' do
          let(:week_day) { %w[mon tue wed thu fri sat sun].sample }

          it { expect(errors[:week_day]).not_to include "is not included in the list" }
        end
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

module Companies
  RSpec.describe DeliveryTimeChange do
    let(:operation_run) { described_class.run(params) }
    let(:result) { operation_run[0] }
    let(:operation) { operation_run[1] }

    let(:params) do
      {
        id: company.id,
        week_day: week_day,
        time_start: time_start,
        time_end: time_end,
      }
    end

    let(:company) { create(:company) }
    let(:week_day) { 'wed' }
    let(:time_start) { Time.current.strftime('%T') }
    let(:time_end) { 7.minutes.from_now.strftime('%T') }

    describe '#process' do
      it { expect(result).to eq true }
      it { expect(operation.model.reload.company_id).to eq company.id }
      it { expect(operation.model.reload.time_start).to eq time_start + Time.zone.formatted_offset(false)[0..2] }
      it { expect(operation.model.reload.time_end).to eq time_end + Time.zone.formatted_offset(false)[0..2] }
    end
  end
end

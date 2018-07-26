# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Companies', acceptance: true do
  post '/companies/:id/delivery_time_change' do
    header 'Authorization', :auth_header
    let(:auth_header) { ActionController::HttpAuthentication::Basic.encode_credentials(user.email, password) }

    let(:user) { create(:user, password: password) }
    let(:password) { Faker::Internet.password(8, 12) }

    parameter :week_day, required: true
    parameter :time_start, required: true
    parameter :time_end, required: true

    let(:company) { create(:company) }
    let(:id) { company.id }
    let(:time_start) { Time.current.strftime('%T') }
    let(:time_end) { Time.current.strftime('%T') }
    let(:week_day) { %w[mon tue wed thu fri sat sun].sample }

    example_request 'Delivery Time changed' do
      expect(response_status).to eq 201
    end

    example 'Delivery Time change (FAIL)' do
      do_request(time_start: nil)
      expect(response_status).to eq 422
    end
  end
end

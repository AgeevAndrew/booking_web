# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Companies', acceptance: true do
  get '/api/companies/:id' do
    let(:company) { create(:company, :with_schedule) }
    let(:id) { company.id }

    parameter :id, required: true

    example 'Show' do
      do_request
      expect(status).to eq(200)
    end

    example 'Show (not found)' do
      do_request(id: 0)
      expect(status).to eq(404)
    end
  end
end

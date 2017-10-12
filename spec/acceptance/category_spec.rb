# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Categories', acceptance: true do
  post '/api/companies/:company_id/categories/find' do
    let(:categories) { create_list(:category, 3) }
    let(:company) { create(:company, categories: categories.pluck(:id)) }

    let(:company_id) { company.id }

    parameter :company_id, required: true

    example 'Find' do
      do_request
      expect(status).to eq(201)
    end
  end
end

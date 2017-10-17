# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Categories', acceptance: true do
  get '/api/categories' do
    let(:categories) { create_list(:category, 3) }
    let(:company) { create(:company, categories: categories.pluck(:id)) }

    let(:company_id) { company.id }

    parameter :company_id

    example 'Index (for company)' do
      do_request
      expect(status).to eq(200)
    end

    example 'Index ' do
      do_request(company_id: nil)
      expect(status).to eq(200)
    end
  end
end

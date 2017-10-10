# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Products', acceptance: true do
  let(:product) { create(:product) }
  get '/api/products' do
    let(:company_id) { product.company_id }
    let(:category_id) { Faker::Number.number(2) }

    parameter :company_id, required: true
    parameter :category_id

    example 'Find' do
      do_request
      expect(status).to eq(200)
    end

    example 'Find (errors)' do
      do_request(company_id: nil)
      expect(status).to eq(200)
    end
  end
end

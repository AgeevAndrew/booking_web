# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Products', acceptance: true do
  get '/api/products' do
    let(:company) { create(:company) }
    let(:category) { create(:category) }
    let!(:products) { create_list(:product, 3, company: company, category: category) }
    let!(:other_product) { create(:product) }

    let(:company_id) { company.id }
    let(:category_id) { category.id }

    parameter :company_id
    parameter :category_id

    example 'Find' do
      do_request
      expect(status).to eq(200)
    end

    example 'Find all' do
      do_request(company_id: nil, category_id: nil)
      expect(status).to eq(200)
    end
  end

  post '/api/products/:id/visibility_change' do
    header 'Authorization', :auth_header
    let(:auth_header) { ActionController::HttpAuthentication::Basic.encode_credentials(user.email, password) }

    let(:user) { create(:user, password: password) }
    let(:password) { Faker::Internet.password(8, 12) }

    let(:product) { create(:product) }

    let(:id) { product.id }

    parameter :id, required: true
    parameter :active, required: true

    example 'Activate' do
      do_request(active: true)
      expect(status).to eq(201)
    end

    example 'Deactivate' do
      do_request(active: false)
      expect(status).to eq(201)
    end

    example 'Deactivate (errors)' do
      do_request(active: nil)
      expect(status).to eq(422)
    end
  end

  post '/api/products/:id/update' do
    header 'Authorization', :auth_header
    let(:auth_header) { ActionController::HttpAuthentication::Basic.encode_credentials(user.email, password) }

    let(:user) { create(:user, password: password) }
    let(:password) { Faker::Internet.password(8, 12) }

    let(:product) { create(:product) }

    let(:id) { product.id }

    parameter :id, required: true
    parameter :company_id, required: true
    parameter :category_id, required: true
    parameter :title, required: true
    parameter :description, required: true
    parameter :brief, required: true
    parameter :photo, required: true
    parameter :main_options, required: true
    parameter :additional_info, required: true

    let(:company_id) { product.company_id }
    let(:category_id) { product.category_id }
    let(:title) { Faker::Food.dish }
    let(:description) { Faker::Lorem.paragraph }
    let(:brief) { Faker::Lorem.sentence(3, true, 4) }
    let(:photo) { Faker::Internet.url }
    let(:main_options) {
      [
        { 'cost' => Faker::Number.unique.number(2), 'name' => Faker::Food.unique.measurement },
        { 'cost' => Faker::Number.unique.number(2), 'name' => Faker::Food.unique.measurement },
      ]
    }
    let(:additional_info) {
      [
        { 'name' => Faker::Food.unique.ingredient, 'cost' => Faker::Number.unique.number(2) },
        { 'name' => Faker::Food.unique.ingredient, 'cost' => Faker::Number.unique.number(2) },
      ]
    }

    example 'Update' do
      do_request(active: true)
      expect(status).to eq(201)
    end

    example 'Update (errors)' do
      do_request(title: nil)
      expect(status).to eq(422)
    end
  end
end

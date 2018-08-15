# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'Tidings', acceptance: true do
  post '/tidings', document: false do
    header 'Authorization', :auth_header
    let(:auth_header) { ActionController::HttpAuthentication::Basic.encode_credentials(user.email, password) }
    let(:user) { create(:user, password: password) }
    let(:password) { Faker::Internet.password(8, 12) }

    parameter :category, required: true
    parameter :company_id, required: true
    parameter :title, required: true
    parameter :body, required: true
    parameter :message, required: true
    parameter :active, required: true
    let(:company) { create(:company)}
    let(:company_id) { company.id }
    let(:category) { Tiding.categories.key(1) }
    let(:title) { Faker::Lorem.sentence }
    let(:body) { Faker::Lorem.sentence }
    let(:message) { Faker::Lorem.sentence }
    let(:active) { Tiding.actives.key(1) }


    example_request 'Create tiding' do
      expect(response_status).to eq 201
    end

    example 'Invalid param' do
      do_request(category: 1)
      expect(response_status).to eq 422
    end
  end

  post '/tidings/:id/update', document: false do
    header 'Authorization', :auth_header
    let(:auth_header) { ActionController::HttpAuthentication::Basic.encode_credentials(user.email, password) }
    let(:user) { create(:user, password: password) }
    let(:password) { Faker::Internet.password(8, 12) }

    parameter :category, required: true
    parameter :company_id, required: true
    parameter :title, required: true
    parameter :body, required: true
    parameter :message, required: true
    parameter :active, required: true
    parameter :id, required: true

    let(:company) { create(:company) }
    let(:tiding) { create(:tiding, company: company) }
    let(:id) { tiding.id }
    let(:company_id) { company.id }
    let(:category) { Tiding.categories.key(1) }
    let(:title) { Faker::Lorem.sentence }
    let(:body) { Faker::Lorem.sentence }
    let(:message) { Faker::Lorem.sentence }
    let(:active) { Tiding.actives.key(1) }

    example_request 'Update tiding' do
      expect(response_status).to eq 201
    end

    example 'Not found tiding' do
      do_request(id: 0)
      expect(response_status).to eq 404
    end

  end

  post 'tidings/:id/activate', document: false do
    header 'Authorization', :auth_header
    let(:auth_header) { ActionController::HttpAuthentication::Basic.encode_credentials(user.email, password) }
    let(:user) { create(:user, password: password) }
    let(:password) { Faker::Internet.password(8, 12) }

    let(:company) { create (:company) }
    let(:tiding) { create(:tiding, company: company, active: 0) }
    let(:id) { tiding.id }
    example_request 'Activate tiding' do
      expect(response_status).to eq 201
      body = JSON.parse(response_body)
      expect(body["active"]).to eq "on"
    end
    example 'Activate not_found' do
      do_request(id: 0)
      expect(response_status).to eq 404
    end
  end

  post 'tidings/:id/deactivate', document: false do
    header 'Authorization', :auth_header
    let(:auth_header) { ActionController::HttpAuthentication::Basic.encode_credentials(user.email, password) }
    let(:user) { create(:user, password: password) }
    let(:password) { Faker::Internet.password(8, 12) }

    let(:company) { create (:company) }
    let(:tiding) { create(:tiding, company: company) }
    let(:id) { tiding.id }
    example 'Deactivate first' do
      do_request
      expect(response_status).to eq 201
      body = JSON.parse(response_body)
      expect(body["active"]).to eq "off"
    end
    example 'Deactivate not_found' do
      do_request(id: 0)
      expect(response_status).to eq 404
    end
  end

  delete 'tidings/:id', document: false do
    header 'Authorization', :auth_header
    let(:auth_header) { ActionController::HttpAuthentication::Basic.encode_credentials(user.email, password) }
    let(:user) { create(:user, password: password) }
    let(:password) { Faker::Internet.password(8, 12) }

    let(:company) { create(:company) }
    let(:tiding) { create(:tiding, company: company) }
    let(:id) { tiding.id }
    example_request 'Delete tiding' do
      expect(response_status).to eq 204
    end

    example 'Delete not found' do
      do_request(id: 0)
      expect(response_status).to eq 404
    end
  end

  get 'api/tidings' do
    parameter :company_id, required: true
    let(:company) { create(:company) }
    let!(:tiding) { create(:tiding, company: company) }
    let!(:tiding1) { create(:tiding, company: company) }
    let!(:tiding2) { create(:tiding, company: company) }
    let(:company_id) { company.id }
    example_request 'Index' do
      expect(response_status).to eq 200
    end
  end

  get 'api/tidings/:id' do
    let(:company) { create(:company) }
    let(:tiding) { create(:tiding, company: company) }
    let(:id) { tiding.id }

    example_request 'Show' do
      expect(response_status).to eq 200
    end

    example 'Show (not found)' do
      do_request(id: 0)
      expect(response_status).to eq 404
    end
  end
end

# frozen_string_literal: true

require 'acceptance_helper'

RSpec.resource 'PushMessages', acceptance: true do
  post '/api/push_messages' do
    header 'Authorization', :auth_header
    let(:auth_header) { ActionController::HttpAuthentication::Basic.encode_credentials(user.email, password) }

    let(:user) { create(:user, password: password) }
    let(:password) { Faker::Internet.password(8, 12) }

    let(:success) { Faker::Number.number(2).to_i }
    let(:failure) { Faker::Number.number(2).to_i }

    let(:title) { Faker::Lorem.sentence }
    let(:body) { Faker::Lorem.sentence }

    parameter :title, required: true
    parameter :body, required: true

    before do
      use_case = instance_double(FMC::PushNotification)
      result = instance_double(FMC::Response::Push, success: success, failure: failure)
      allow(use_case).to receive(:result).and_return(result)
      allow(FMC::PushNotification).to receive(:perform).and_return(use_case)
    end

    example 'Create' do
      do_request
      expect(status).to eq(201)
    end

    example 'Create (errors)' do
      do_request(locale: 'ru', title: nil, body: nil)
      expect(status).to eq(422)
    end
  end
end

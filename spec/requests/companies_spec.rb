# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe "GET /companies/id" do
    let(:company) { create(:company) }
    it "success companies" do
      get company_path(id: company.id)
      expect(response).to have_http_status(200)
    end
    it "not found companies" do
      get company_path(id: 0)
      expect(response).to have_http_status(404)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { create(:user, company: order.company) }
  let(:order) { create(:order, :with_products) }

  describe "GET /orders" do
    it "works! (now write some real specs)" do
      get orders_path(company_id: order.company_id), headers: auth_headers
      expect(response).to have_http_status(200)
    end
  end
end

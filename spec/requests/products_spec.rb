require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "works! (now write some real specs)" do
      get products_path(company_id: FactoryGirl.create(:company).id)
      expect(response).to have_http_status(200)
    end
  end
end

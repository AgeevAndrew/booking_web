require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  describe "GET /api/accounts" do
    it "works! (now write some real specs)" do
      get api_accounts_path
      expect(response).to have_http_status(200)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Tidings", type: :request do

  describe "GET /tidings" do
    it "success tidings" do
      get tidings_path(), headers: auth_headers
      expect(response).to have_http_status(200)
    end
  end

end

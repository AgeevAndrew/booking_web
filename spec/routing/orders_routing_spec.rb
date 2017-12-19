# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::OrdersController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/api/orders").to route_to("api/orders#create", format: :json)
    end
  end
end

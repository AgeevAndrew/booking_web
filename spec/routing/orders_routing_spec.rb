# frozen_string_literal: true

require "rails_helper"

RSpec.describe OrdersController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/api/orders").to route_to("orders#create", format: :json)
    end
  end
end

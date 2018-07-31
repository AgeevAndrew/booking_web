# frozen_string_literalL: true

require "rails_helper"

RSpec.describe Api::AccountsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/accounts").to route_to("api/accounts#index", format: :json)
    end

    it "routes to #new" do
      expect(:get => "/api/accounts/new").to route_to("api/accounts#new", format: :json)
    end

    it "routes to #show" do
      expect(:get => "/api/accounts/1").to route_to("api/accounts#show", :id => "1", format: :json)
    end

    it "routes to #edit" do
      expect(:get => "/api/accounts/1/edit").to route_to("api/accounts#edit", :id => "1", format: :json)
    end

    it "routes to #create" do
      expect(:post => "/api/accounts").to route_to("api/accounts#create", format: :json)
    end

    it "routes to #update via POST" do
      expect(:post => "/api/accounts/1/update").to route_to("api/accounts#update", :id => "1", format: :json)
    end

    it "routes to #destroy" do
      expect(:delete => "/api/accounts/1").to route_to("api/accounts#destroy", :id => "1", format: :json)
    end


  end
end

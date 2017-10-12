require "rails_helper"

RSpec.describe ProductsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/companies/1/products").to route_to("products#index", company_id: '1', "format"=>:json)
    end

    it "routes to #new" do
      expect(:get => "/api/companies/1/products/new").to route_to("products#new", company_id: '1', "format"=>:json)
    end

    it "routes to #show" do
      expect(:get => "/api/companies/1/products/1").to route_to("products#show", company_id: '1', :id => "1", "format"=>:json)
    end

    it "routes to #edit" do
      expect(:get => "/api/companies/1/products/1/edit").to route_to("products#edit", company_id: '1', :id => "1", "format"=>:json)
    end

    it "routes to #create" do
      expect(:post => "/api/companies/1/products").to route_to("products#create", company_id: '1', "format"=>:json)
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/companies/1/products/1").to route_to("products#update", company_id: '1', :id => "1", "format"=>:json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/companies/1/products/1").to route_to("products#update", company_id: '1', :id => "1", "format"=>:json)
    end

    it "routes to #destroy" do
      expect(:delete => "/api/companies/1/products/1").to route_to("products#destroy", company_id: '1', :id => "1", "format"=>:json)
    end

  end
end

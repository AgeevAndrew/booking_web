require "rails_helper"

RSpec.describe CategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/companies/1/categories").to route_to("categories#index", company_id: "1", format: :json)
    end

    it "routes to #new" do
      expect(:get => "/api/companies/1/categories/new").to route_to("categories#new", company_id: "1", format: :json)
    end

    it "routes to #show" do
      expect(:get => "/api/companies/1/categories/1").to route_to("categories#show", company_id: "1", :id => "1", format: :json)
    end

    it "routes to #edit" do
      expect(:get => "/api/companies/1/categories/1/edit").to route_to("categories#edit", company_id: "1", :id => "1", format: :json)
    end

    it "routes to #create" do
      expect(:post => "/api/companies/1/categories").to route_to("categories#create", company_id: "1", format: :json)
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/companies/1/categories/1").to route_to("categories#update", company_id: "1", :id => "1", format: :json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/companies/1/categories/1").to route_to("categories#update", company_id: "1", :id => "1", format: :json)
    end

    it "routes to #destroy" do
      expect(:delete => "/api/companies/1/categories/1").to route_to("categories#destroy", company_id: "1", :id => "1", format: :json)
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe TidingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/tidings").to route_to("tidings#index")
    end

    it "routes to #create" do
      expect(:post => "/tidings").to route_to("tidings#create")
    end

    it "routes to #update" do
      expect(:post => "/tidings/1/update").to route_to("tidings#update", :id => "1")
    end

    it "routes to #delete" do
      expect(:delete => "/tidings/1").to route_to("tidings#destroy", :id => "1")
    end

    it "routes to #activate" do
      expect(:post => "/tidings/1/activate").to route_to("tidings#activate", :id => "1")
    end

    it "routes to #deactivate" do
      expect(:post => "/tidings/1/deactivate").to route_to("tidings#deactivate", :id => "1")
    end
  end
end

require "rails_helper"

RSpec.describe PushMessagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/push_messages").to route_to("push_messages#index")
    end
  end
end

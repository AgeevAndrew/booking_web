require 'rails_helper'

RSpec.describe TidingsController, type: :controller do
  let(:company) { create(:company) }

  let(:valid_params) {
    {
        company: :company.id,
        title: "Title",
        body: "text text",
        message: "text for message",
        active: 1
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "return success response" do
      get :index
      expect(response).to be_truthy
    end
  end

  describe "POST #create" do
    it "create a new Tiding" do
      expect {
        post :create, params: :valid_params, session: :valid_session
      }.to change(Tiding, :count).by(1)
    end
  end

end

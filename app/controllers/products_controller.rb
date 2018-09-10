# frozen_string_literal: true

class ProductsController < BaseController
  before_action :authenticate_user!, only: [:create]

  respond_to :json

  def index; end

  # POST /products
  def create
    respond Products::Create, location: nil
  end

  private

  def store_facade
    Store::Facades::ProductsFacade
  end
end

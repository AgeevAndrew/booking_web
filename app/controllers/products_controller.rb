# frozen_string_literal: true

class ProductsController < BaseController
  def index; end

  private

  def store_facade
    Store::Facades::ProductsFacade
  end
end

class ProductsController < ApplicationController
  def index
    @products = Product.all.as_json
  end
end

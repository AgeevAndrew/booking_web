class ProductsController < ApplicationController
  def index
    @products = Product.order(:id).as_json
    redux_store('SharedReduxStore', props: { products: @products })
  end
end

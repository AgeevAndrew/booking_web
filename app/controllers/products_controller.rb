class ProductsController < ApplicationController
  def index
    @products = Product.all.as_json
    redux_store('SharedReduxStore', props: { products: @products })
  end
end

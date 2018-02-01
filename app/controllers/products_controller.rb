class ProductsController < BaseController
  def index
    _, operation = Products::Index.run params
    redux_store('SharedReduxStore', props: operation.to_json )
  end
end

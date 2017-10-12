Rails.application.routes.draw do
  scope "/api", defaults: { format: :json } do
    resources :companies do
      resources :products
      resources :categories do
        post 'find', on: :collection
      end
    end
    resources :accounts
  end
end

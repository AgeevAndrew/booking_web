Rails.application.routes.draw do
  resources :accounts
  resources :categories
  resources :companies

  scope "/api", defaults: { format: :json } do
    resources :products
    resources :categories
    resources :companies
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  scope "/api", defaults: { format: :json } do
    resources :companies
    resources :products
    resources :categories
    resources :accounts, except: :update do
      post 'update', on: :member

      resources :addresses, only: [:index, :create, :update, :destroy]
    end
    resources :orders
  end
end

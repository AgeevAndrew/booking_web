# frozen_string_literal: true

Rails.application.routes.draw do
  scope "/api", defaults: { format: :json } do
    resources :companies
    resources :products
    resources :categories
    resources :accounts, except: :update do
      post 'update', on: :member
    end
  end
end

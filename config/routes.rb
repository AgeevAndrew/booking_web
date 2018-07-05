# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  get 'products', to: 'products#index'
  resources :push_messages, only: [:index]

  concern :app_api do
    resources :companies do
      post :delivery_time_change, on: :member
    end

    resources :push_messages, only: [:create]

    resources :products, except: :update do
      post :visibility_change, on: :member
      post 'update', on: :member
    end

    resources :categories
    resources :accounts, except: :update do
      post 'update', on: :member
      post 'register_device', on: :member
      resources :addresses, only: [:index, :create, :update, :destroy]
    end
    resources :orders, only: [:index, :create] do
      post :accept, on: :member
      post :cancel, on: :member
    end
  end

  namespace :api, defaults: { format: :json } do
    concerns :app_api
  end

  resources :orders, only: [:index] do
    get :accept, on: :member
    get :cancel, on: :member
  end
end

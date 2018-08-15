# frozen_string_literal: true

Rails.application.routes.draw do

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
      delete 'delete_orders', on: :member
      resources :addresses, only: [:index, :create, :update, :destroy]
    end
    resources :orders, only: [:index, :create] do
      post :accept, on: :member
      post :cancel, on: :member
    end

    resources :tidings, only: [:index, :show]
  end

  namespace :api, defaults: { format: :json } do
    concerns :app_api
  end

  devise_for :users
  root to: "products#index"
  get 'products', to: 'products#index'
  resources :push_messages, only: [:index]

  resources :companies, only: [:show] do
    post :delivery_time_change, on: :member
  end

  resources :orders, only: [:index] do
    get :accept, on: :member
    get :cancel, on: :member
  end

  resources :tidings, only: [:index, :create, :destroy] do
    post :activate, on: :member
    post :deactivate, on: :member
    post 'update', on: :member
  end
end

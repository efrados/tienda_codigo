# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :admin_users
      resources :products
      resources :query_products
      resources :unanswered_queries, only: [:index]
      root to: "users#index"
  end

  devise_for :users
  get 'static_pages/about'
  get 'favorites', to: 'products#favorites'
  post '/', to: 'products#index'
  root to: 'products#index'
  resources :favorites, only: [] do
    member do
      get 'add'
      get 'remove'
    end
  end
  resources :products, only: :show do
    resources :query_products
  end
end

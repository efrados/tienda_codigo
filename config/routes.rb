# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :admin_users
    resources :products
    resources :query_products
    resources :statistics, only: [:index] do
      collection do
        get 'top_ten_fav'
        get 'top_ten_query'
      end
    end
    root to: 'users#index'
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'static_pages/about'
  get 'favorites', to: 'products#favorites'
  get 'queries', to: 'query_products#index'
  post '/', to: 'products#index'
  root to: 'products#index'
  resources :products, only: :show do
    resources :favorites, only: %i[create destroy]
    resources :query_products
  end

  resources :query_products, only: [] do
    resources :query_recommendations, only: %i[create destroy]
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :products
      resources :query_products

      root to: "users#index"
    end
  devise_for :users
  get 'static_pages/about'
  root to: 'static_pages#index'
  resources :products, only: :show do
    resources :query_products
  end
end

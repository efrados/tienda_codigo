Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/about'
  root to: "static_pages#index"
  resources :products, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

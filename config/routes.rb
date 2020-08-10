Rails.application.routes.draw do
  devise_for :users

  root to: 'customers#index'
  namespace :customers do
    resources :searches, only: :index, defaults: { format: :json }
  end
  resources :customers
  resources :orders
end

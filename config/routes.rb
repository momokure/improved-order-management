Rails.application.routes.draw do
  devise_for :users
  resources :customers
  resources :orders
end

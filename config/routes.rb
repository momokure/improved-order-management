Rails.application.routes.draw do
  devise_for :users

  root to: 'customers#index'
  namespace :customers do
    resources :searches, only: :index, defaults: { format: :json }
  end
  resources :customers

  namespace :orders do
    namespace :representative do
      resources :backlog, only: :index
      resources :wip, only: :index
      resources :done, only: :index
    end
    namespace :pasteup do
      resources :backlog, only: :index
      resources :wip, only: :index
      resources :done, only: :index
    end
    end
  resources :orders
end

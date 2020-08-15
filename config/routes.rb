Rails.application.routes.draw do
  devise_for :users

  root to: 'customers#index'
  namespace :customers do
    resources :searches, only: :index, defaults: { format: :json }
  end
  resources :customers

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

  namespace :accounting do
    resources :backlog, only: [:index, :update]
    resources :wip, only: :index
    resources :done, only: :index
  end

  resources :orders do
    member do
      patch 'update_representative_user'
    end
  end
end
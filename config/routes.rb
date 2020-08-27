Rails.application.routes.draw do
  devise_for :users

  root to: 'orders#index'

  # resources :users, index, show

  namespace :customers do
    resources :searches, only: :index, defaults: { format: :json }
  end
  resources :customers

  namespace :order_management do
    resources :undefined_date, only: :index
    resources :undefined_factory, only: :index
    resources :change_delivery_date, only: :index
  end

  namespace :representative do
    resources :backlog, only: :index
    resources :wip, only: :index
    resources :done, only: :index
    resources :today, only: :index
  end

  namespace :accounting do
    resources :backlog, only: :index
    resources :deadline, only: :index
  end

  namespace :domestic_buying do
    resources :backlog_all, only: :index
    resources :backlog_blank, only: :index
    resources :backlog_paid, only: :index
    resources :backlog_toda1, only: :index
    resources :backlog_bijogi, only: :index
    resources :backlog_mixed, only: :index
    resources :wip, only: :index
    resources :done, only: :index
    resources :sorting, only: :index
  end

  namespace :overseas_buying do
    resources :backlog, only: :index
    resources :done, only: :index
  end

  namespace :toda1 do
    resources :all, only: :index
    resources :silkscreen_a, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :inkjet, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :embroidery, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :sewing, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
  end

  namespace :bijogi do
    resources :all, only: :index
    resources :silkscreen_a, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :inkjet, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :embroidery, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :sewing, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :silkscreen_b, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :silkscreen_c, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :uv, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
  end

  namespace :yoyogi do
    resources :silkscreen_d, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
  end

  resources :orders do
    get :calendar, on: :collection
    member do
      patch 'update_representative_user'
    end
  end

  resources :payments
end
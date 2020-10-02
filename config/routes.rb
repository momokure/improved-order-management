Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, :index, :show

  root to: 'orders#index'

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
    resources :report, only: :index
  end

  namespace :accounting do
    resources :all, only: :index
    resources :backlog, only: :index
    resources :deadline, only: :index
    resources :for_representative, only: :index
    resources :invoicing, only: :index
  end

  namespace :pasteup do
    resources :calendar, only: :index
  end

  namespace :domestic_buying do
    resources :backlog_all, only: :index
    resources :backlog_paid, only: :index
    resources :backlog_payment_date, only: :index
    resources :backlog_blank, only: :index
    resources :wip, only: :index
    resources :wip_buying_user, only: :index
    resources :done, only: :index
  end

  namespace :overseas_buying do
    resources :all, only: :index
    resources :backlog, only: :index
  end

  namespace :toda1 do
    resources :blank, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :all, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :sorting, only: :index do
      get :backlog, on: :collection
      get :done, on: :collection
    end
    resources :silkscreen_a, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :inkjet, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :embroidery, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
      get :report, on: :collection
    end
    resources :sewing, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
  end

  namespace :bijogi do
    resources :blank, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :all, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :sorting, only: :index do
      get :backlog, on: :collection
      get :done, on: :collection
    end
    resources :silkscreen_a, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :inkjet, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :embroidery, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :sewing, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :silkscreen_b, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :silkscreen_c, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :uv, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
  end

  namespace :yoyogi do
    resources :all, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
    end
    resources :blank, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :silkscreen_d, only: :index do
      get :wip, on: :collection
      get :done, on: :collection
      get :pasteup_wip, on: :collection
      get :pasteup_done, on: :collection
    end
    resources :silkscreen_d_cassette, only: :index
  end

  resources :orders do
    get :calendar, on: :collection
    member do
      get 'pasteup'
      patch 'update_representative_user'
    end
  end

  resources :payments
end
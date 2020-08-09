Rails.application.routes.draw do
  devise_for :users
  resources :customers
  resources :orders do
    collection do
      get 'register'
    end
  end
end

Rails.application.routes.draw do
  resources :audit_logs, except: [:new, :edit, :destroy] do
    collection do
      get 'confirmed', to: 'audit_logs#confirmed'
    end
  end
  namespace :admin do
      resources :users
      resources :posts
      resources :admin_users

      root to: "users#index"
    end
  resources :posts do
    member do
      get :approved
    end
  end
  devise_for :users, skip: [:registrations]
  root to: 'pages#home'
end

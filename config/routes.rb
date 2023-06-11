Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'costs#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'splash#first_screen', as: :unauthenticated_root
  end

  get 'first_screen', to: 'splash#first_screen'

  get 'user_profile', to: 'pages#user_profile'

  get 'balances/new', to: 'balances#new'
  post 'balances/new', to: 'balances#create'

  get 'currencies', to: 'currencies#index'

  resources :costs, except: [:show]
  resources :categories
end

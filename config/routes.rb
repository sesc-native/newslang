Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
authenticated :user do
    root 'home#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
  
  resources :authentications, only: [:destroy]
  
  get 'home', to: 'home#index'
  get 'users/home', to: 'home#index'
  
  get 'newsapi', to: 'home#index'
  
end

Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :weddings do
    resources :registries
    resources :reviews
    resources :tasks do
      resources :messages, only: [:create, :index, :new, :destroy]
    end
  end
  mount Attachinary::Engine => "/attachinary"

  get "users/show", to: 'pages#profile'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

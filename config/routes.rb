  Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :deals, only: [:index, :show] do
  #   resources :properties, only: [:show]
  # end
  #

  # namespace :admin do
  #   resources :properties, only: [:show]
  # end
  resources :deals do
    resources :properties
    resources :tenants, only: [:create]
  end
  # resources :properties, except: [:show]

  # resources :deals, except: [:index, :show]

  #
  # namespace :properties do
  #   resources :properties, :only => [:index, :create]
  # end
end

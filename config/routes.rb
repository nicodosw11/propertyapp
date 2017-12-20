  Rails.application.routes.draw do
  namespace :admin do
    root "application#index"
    resources :deals, only: [:new, :create, :destroy]
    resources :users do
      member do
        patch :archive
      end
    end
  end

  # devise_for :users # => "/users/sign_in"
  # devise_for :users, :path_prefix => 'devise' # => "/devise/users/sign_in"
  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'register'}

  resources :users, :only => [:index, :show]
  root to: 'pages#home'
  get 'seller', to: 'pages#seller'
  get 'risks', to: 'pages#risks'
  get 'legal', to: 'pages#legal'
  get 'siteadmin/tenants', to: "tenants#all"
  get 'siteadmin/properties', to: "properties#all"
  get 'siteadmin/tenants', to: "tenants#all"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :deals, only: [:index, :show, :edit, :update] do
    # resources :investments, only: [:new, :create, :destroy]
    resources :investments
    scope '/siteadmin' do
      # resources :investments, only: [:index, :show]
      resources :properties
      resources :tenants
    end
    # resources :properties, path: '/admin'
  end



  # resources :deals
  # get "deals",                                      to: "deals#index"
  # get "deals/new",                                  to: "deals#new", as: "new_deal"
  # post "deals",                                     to: "deals#create"
  # get "deals/:id",                                  to: "deals#show", as: "deal"
  # get "deals/:id/edit",                             to: "deals#edit", as: "edit_deal"
  # patch "deals/:id",                                to: "deals#update"
  # delete "deals/:id",                               to: "deals#destroy"


  # scope '/siteadmin' do
  #   resources :deals, only: [:new, :edit]
  #   # resources :deals, except: [:index, :show]
  # end
  #same as
  # resources :deals, except: [:index, :show], path: '/admin/deals'

  # get "deals/:deal_id/properties"                   to: "properties#index" as: :properties
  # get "deals/:deal_id/properties/new",              to: "properties#new" as: :new_property
  # post "deals/:deal_id/properties",                 to: "properties#create"
  # get "deals/:deal_id/properties/:id"               to: "properties#show"
  # get "deals/:deal_id/properties/:id/edit",         to: "properties#edit" as: :edit_property
  # patch "deals/:deal_id/properties/:id",            to: "properties#update"
  # delete "deals/:deal_id/properties/:id",           to: "properties#destroy" as: :destroy_property

  # resources :deals do
  #   resources :properties, except: [:index]
  # end

  # resources :properties, only: [:index]
  # get 'properties/:id' => "properties#show"

  # resources :properties, except: [:show]
  # resources :deals, except: [:index, :show]

  #############################
  # priority of routes in Rails
  # namespace :admin do
  #   resources :blogs
  #   resources :users, only: [:index, :show]
  #   resources :comments, only: [:create, :new, :destroy]
  # end

  # resources :blogs, only: [:index, :show] do
  #   resources :comments, only: [:create]
  # end
  #############################
  #############################
  #Namespacing
  # namespace :repository do
  #   resources :articles, :only => [:index, :create]
  # end
  # Admin::ArticlesController without the prefix /admin
  # resources :articles, module: 'admin'
  # or
  # scope module: 'admin' do
  #   resources :articles, :comments
  # end
  # ArticlesController with the prefix /admin
  # resources :articles, path: '/admin/articles'
  # or
  # scope '/admin' do
  #   resources :articles, :comments
  # end
  #Nested Resources
  # /magazines/1/ads/2
  # resources :magazines do
  #   resources :ads
  # end
  # /publishers/1/magazines/2/photos/3
  # resources :publishers do
  #   resources :magazines do
  #     resources :photos
  #   end
  # end
  #############################

end

  Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :path_prefix => '&'
  resources :users, :only => [:index, :show]
    resources :investments, :only => [:index, :show]
  root to: 'pages#home'
  get 'siteadmin/properties', to: "properties#all"
  get 'siteadmin/tenants', to: "tenants#all"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # get "deals",                                      to: "deals#index"
  # get "deals/new",                                  to: "deals#new"
  # post "deals",                                     to: "deals#create"
  # get "deals/:id",                                  to: "deals#show"
  # get "deals/:id/edit",                             to: "deals#edit"
  # patch "deals/:id",                                to: "deals#update"
  # delete "deals/:id",                               to: "deals#destroy"

  resources :deals, only: [:index, :show, :create, :update, :destroy] do
    resources :investments, only: [:create, :destroy]
    scope '/siteadmin' do
      resources :properties
      resources :tenants
    end
    # resources :properties, path: '/admin'
  end

  scope '/siteadmin' do
    resources :deals, only: [:new, :edit]
    # resources :deals, except: [:index, :show]
    resources :investments, only: [:index, :show]
  end
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

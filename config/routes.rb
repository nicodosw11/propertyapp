  Rails.application.routes.draw do
  # MUST be declared before the mount ForestLiana::Engine.
  namespace :forest do
    post '/actions/validate' => 'investments#validate'
  end
  mount ForestLiana::Engine => '/forest'
  namespace :admin do
    root "application#index"
    resources :deals, only: [:index, :new, :create, :destroy]
    resources :deals, only: [ ] do
      collection do
        get 'listed'
      end
      member do
        get 'description'
        get 'listing'
        get 'location'
        get 'photo_upload'
        get 'pricing'
        get 'period'
        get 'tenancy'
        get :snapshot
      end
      resources :photos, only: [:create, :destroy]
    end
    resources :users do
      member do
        get :snapshot
        patch :archive
        put :avatar
      end
    end
    resources :investments, only: [:index, :show, :edit, :update, :destroy] do
      member do
        patch :validate
      end
    end
  end

  # devise_for :users # => "/users/sign_in"
  # devise_for :users, :path_prefix => 'devise' # => "/devise/users/sign_in"
  scope '(:locale)', locale: /fr|en/ do
    devise_for :users,
               path: '',
               path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'register'},
               controllers: {registrations: 'registrations'}
    get 'dashboard' => 'dashboards#index'
    root to: 'pages#home'
    get 'seller', to: 'pages#seller'
    get 'risks', to: 'pages#risks'
    get 'legal', to: 'pages#legal'
    get 'contact', to:'pages#contact'
    get 'faq', to:'pages#faq'
    get 'siteadmin/tenants', to: "tenants#all"
    get 'siteadmin/properties', to: "properties#all"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # resources :deals, only: [:index, :show, :edit, :update] do
    resources :deals, only: [:index, :show, :edit, :update], path: 'opportunities', :path_names => { :new => 'invest', :edit => 'modify' } do
      # resources :investments, only: [:new, :create, :destroy]
      resources :investments
      scope '/siteadmin' do
        # resources :investments, only: [:index, :show]
        resources :properties
        resources :tenants
      end
      # resources :properties, path: '/admin'
    end
    resources :users do
      member do
        post '/verify_phone_number' => 'users#verify_phone_number'
        patch '/update_phone_number' => 'users#update_phone_number'
      end
    end
  get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  get '', to: redirect("/#{I18n.default_locale}")

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

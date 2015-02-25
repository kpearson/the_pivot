Rails.application.routes.draw do
 #  mount Sidekiq::Web => '/sidekiq'

  root "home#index"
  get "/not_found", to: "home#not_found"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/carts", to: "carts#create"
  delete "/carts", to: "carts#destroy"
  get "/admin/filtered_reservations", to: "admin/reservations#filtered_reservations"

  resources :categories, only: [:index, :show]
  resources :listings, only: [:index]

  post '/noteifications' => 'notification#create'

 # post   '/:user_slug/listings'          , 'user/listings#create' , as: :user_listings
 # get    '/:user_slug/listings/new'      , 'user/listings#new'    , as: :new_user_listing
 # get    '/:user_slug/listings/:id/edit' , 'user/listings#edit'   , as: :edit_user_listing
 # get    '/:user_slug/listings/:id'      , 'user/listings#show'   , as: :user_listing
 # patch  '/:user_slug/listings/:id'      , 'user/listings#update'
 # put    '/:user_slug/listings/:id'      , 'user/listings#update'
 # delete '/:user_slug/listings/:id'      , 'user/listings#destroy'

  resources :users

  resources :admins

  namespace :user, path: "/:slug" do
    resources :listings, except: [:index]
    get '/dashboard', to: 'dashboard#index'
    resources :reservations, only: [:new, :create, :index]
  end

  namespace :user, path: "/:slug", as: :host do
    resources :reservations, only: [:index, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :categories, only: [:edit, :update, :create, :new, :destroy]
  end
end

Rails.application.routes.draw do
  root "home#index"
  get "/not_found", to: "home#not_found"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/carts", to: "carts#create"
  delete "/carts", to: "carts#destroy"
  get "/admin/filtered_reservations", to: "admin/reservations#filtered_reservations"

  resources :reservations, only: [:new]

  resources :categories, only: [:index, :show]
  resources :listings, only: [:index]

  post "/notifications" => "notification#create"

  resources :users

  resources :admins

  namespace :user, path: "/:slug" do
    resources :listings, except: [:index]
    get '/dashboard', to: 'dashboard#index'
    resources :reservations, only: [:create, :index, :destroy]
  end

  namespace :user, path: "/:slug", as: :host do
    resources :reservations, only: [:index, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :categories, only: [:edit, :update, :create, :new, :destroy]
  end
end

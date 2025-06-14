Rails.application.routes.draw do
  get "payments/create"
  get "/dashboard", to: "dashboard#show"
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/logout" => "auth0#logout"
  get "/auth/redirect", to: redirect("/auth/auth0")
  post "payments", to: "payments#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "clothings/search", to: "clothings#search", as: :search_clothings
  get "clothings/autocomplete", to: "clothings#autocomplete"
  resources :clothings, only: [ :index, :new, :create, :show, :edit, :update, :destroy ] do
    resources :reviews, only: [ :create, :destroy ]
    collection do
      get "admin_page", to: "clothings#admin_page"
    end
  end
  resource :cart, only: [ :show ] do
    post "add/:clothings_id", to: "carts#add", as: :add_clothings
    delete "remove/:clothings_id", to: "carts#destroy", as: :remove_clothings
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "clothings#index"
end

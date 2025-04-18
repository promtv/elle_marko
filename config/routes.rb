Rails.application.routes.draw do
  get "/dashboard", to: "dashboard#show"
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/logout" => "auth0#logout"
  get "/auth/redirect", to: redirect("/auth/auth0")

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :clothings, only: [ :index, :show ] do
    collection do
      get "t_shirts", to: "clothings#t_shirts"
      get "shoes", to: "clothings#shoes"
      get "jackets", to: "clothings#jackets"
      get "sweaters", to: "clothings#sweaters"
      get "business_suits", to: "clothings#business_suits"
      get "headwear", to: "clothings#headwear"
    end
  end
  resource :cart, only: [] do
    get "/" => "carts#show"
    post "add/:clothings_id" => "carts#add", as: :add_clothings
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "clothings#index"
end

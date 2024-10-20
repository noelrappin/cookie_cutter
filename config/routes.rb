Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :orders

  # Defines the root path route ("/")
  root "orders#new"
end

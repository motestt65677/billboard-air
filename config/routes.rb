Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "boards#index"
  resources :users
  resource :session, controller: "sessions", only: [:create]
  resources :boards
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post "/boards/:id/bids" => "bids#create", as: "bid_create"

  mount ActionCable.server, at: '/cable'

end

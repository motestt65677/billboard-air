Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "billboards#index"
  
  resources :users do
    resources :boards
  end
  resources :boards, only:[] do
    resources :timeslots, except:[:index]
  end
  get "/billboards" => "billboards#index", as: "billboards"
  get "/users/:user_id/timeslots" => "timeslots#index", as: "timeslots"

  resource :session, controller: "sessions", only: [:create]
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"  
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post "/timeslot/:id/bids" => "bids#create", as: "bid_create"
  post "/timeslots/search" => "timeslots#search", as: "search_timeslots"
  post "/boards/search" => "boards#search", as: "search_boards"
  post "/billboards/search" => "billboards#search", as: "search_billboards"

  mount ActionCable.server, at: '/cable'

end

Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  
  resources :rooms, only: [:new, :create, :destroy]
end

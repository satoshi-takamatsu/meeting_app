Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  
  resources :rooms, only: [:new, :create, :show, :edit, :destroy] do
    resources :comments, only: [:index, :create]
  end
  resources :users, only: [:show]
end

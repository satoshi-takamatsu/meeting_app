Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  get 'rooms/index'
end

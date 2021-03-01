Rails.application.routes.draw do
  devise_for :users
  root to: "meetings#index"
  get 'meetings/index'
end

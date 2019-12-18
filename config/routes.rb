Rails.application.routes.draw do
  get 'users/index'

  root "users#show"

  devise_for :users
  resources :posts
end

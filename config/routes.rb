Rails.application.routes.draw do
  get 'users/index'

  root "posts#index"

  devise_for :users
  resources :posts
end

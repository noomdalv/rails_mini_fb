Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {sign_in: "signin", sign_out: "signout", sign_up: "signup"}
  get 'users/index'
  root "posts#index"
  resources :posts
  resources :comments, only: [:create]
  resources :likes
end

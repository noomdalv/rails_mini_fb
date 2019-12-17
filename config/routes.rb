Rails.application.routes.draw do
  root "posts#show"

  devise_for :users
  resources :posts
end

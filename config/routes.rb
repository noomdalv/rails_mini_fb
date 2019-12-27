Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {sign_in: "signin", sign_out: "signout", sign_up: "signup"}
  get 'users/index'
  resources :users
  resources :posts
  resources :comments, only: [:create]
  resources :likes
  resources :friendships, only: [:create, :destroy, :index]
  post '/acceptrequest', to: 'friendships#accept_request'
  post '/deleterequest', to: 'friendships#delete_request'
  authenticated :user do
    root 'posts#index', as: :authenticated_user
  end

  devise_scope :user do
    root "devise/sessions#new"
  end
end

Rails.application.routes.draw do

  devise_for :users, path: '',
              path_names: {sign_in: "signin", sign_out: "signout", sign_up: "signup"},
              controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
              registrations: 'registrations',
              sessions: 'sessions' }

  get 'users/index'
  resources :users
  resources :contents
  resources :posts
  delete '/dislike', to: 'likes#unlike'
  resources :comments, only: [:create]
  resources :likes
  resources :friendships, only: [:create, :destroy, :index]
  post '/delete_pending_request', to: 'friendships#delete_pending_request'
  post '/acceptrequest', to: 'friendships#accept_request'


  authenticated :user do
    root 'posts#index', as: :authenticated_user
  end

  devise_scope :user do
    root "contents#new"    
  end
end

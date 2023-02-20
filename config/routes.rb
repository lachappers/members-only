Rails.application.routes.draw do
  get 'hangouts/index'
  # root to: "posts#index"

  devise_for :users
  resources :users

  resources :posts
  # , only: [:create, :new, :index]

  root 'hangouts#index'

  resources :messages, only: [:create]
  # root "posts#index"

  # resources :posts do
  #   resources :comments, only: [:create]
  # end
  # resources :likes, only: [:create, :destroy]
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


end

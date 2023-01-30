# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ('/')
  root 'users#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get 'users/:id/posts', to: 'posts#index'
  get 'users/:id/posts/:id', to: 'posts#show'
  get '/posts/new', to: 'posts#new'
  post 'posts/new', to: 'posts#create'
  get '/comments/new', to: 'comments#new'
  post '/comments/new', to: 'comments#create'
  post '/likes/new', to: 'likes#create'
  resources :posts
  resources :users
end

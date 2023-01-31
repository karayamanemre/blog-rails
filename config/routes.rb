# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ('/')
  root 'users#index'
  resources :users do
    resources :posts
  end
  resources :posts do
      resources :likes
    end
  resources :posts do
    resources :comments
  end
end

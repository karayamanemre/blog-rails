# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'users#index'
  resources :users do
    resources :posts do
      delete :destroy, on: :member
      resources :likes
      resources :comments do
        delete :destroy, on: :member
      end
    end
  end
end

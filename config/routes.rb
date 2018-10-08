# frozen_string_literal: true
Rails.application.routes.draw do
  root "root#index"

  namespace :admin do
    resources :users
  end

  resources :products

  get    "/login", to: "sessions#new"
  post   "/login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"
end

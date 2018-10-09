# frozen_string_literal: true
Rails.application.routes.draw do
  root "root#index"

  namespace :admin do
    resources :users, except: %i(new)
  end

  resources :products

  get    "/login", to: "sessions#new"
  post   "/login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"
  get "/signup", to: "admin/users#new"
end

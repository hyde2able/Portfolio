Rails.application.routes.draw do

  resources :users, only: [:index, :show]
  post "users/:id", to: "users#show"

  resources :projects do
    resources :comments, only: [:create, :destroy]
    resource :good_projects, only: [:create, :destroy]
  end

  root "projects#index"
  get "tag/:tag", to: "projects#tag"


  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "users/registrations"}

  mount API::Base => '/'
end

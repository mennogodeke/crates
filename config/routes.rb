Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :formats
  resources :labels
  resources :crates do
    resources :crate_entries
  end
  resources :albums do
    resources :songs
  end
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  resources :artists
end

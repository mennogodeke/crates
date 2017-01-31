Rails.application.routes.draw do
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

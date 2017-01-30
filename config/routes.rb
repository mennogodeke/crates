Rails.application.routes.draw do
  resources :labels
  resources :albums do
    resources :songs
  end
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  resources :artists
end

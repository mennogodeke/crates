Rails.application.routes.draw do
  resources :labels
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  resources :artists
end

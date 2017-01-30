Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  resources :artists
end

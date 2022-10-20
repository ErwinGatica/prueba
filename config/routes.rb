Rails.application.routes.draw do
  devise_for :users
  resources :images
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "messages#home"

  resources :messages, path: :articles

  get "about", to: "messages#about"
  get "geolocation", to: "messages#geolocation"
  get "customized", to: "messages#customized"
end

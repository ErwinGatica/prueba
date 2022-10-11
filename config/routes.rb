Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "messages#home"

  resources :messages
  get "canopy", to: "messages#canopy"

end

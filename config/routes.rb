Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :movies
  resources :users
  resources :comments

  get "/login", to: "session#new"
  post "/login", to: "session#create" 
  get "/logout", to: "session#destroy"

  get "/signup", to: "users#new" 
  post "/signup", to: "users#create"

  namespace :admin do
    get "/admin", to: "dashboard#index"
  end

end

Rails.application.routes.draw do
  devise_for :users
  resources :expenses
  resources :restaurants
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "restaurants#index"

  get '/expenses/new/:id',  to: 'expenses#new', as: 'add_expense'
  post '/expenses/:id',  to: 'expenses#create', as: 'create_expense'
end

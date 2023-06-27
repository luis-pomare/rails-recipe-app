Rails.application.routes.draw do
  resources :recipes
  resources :foods
  devise_for :users
  get '/public_recipes', to: 'public_recipes#index'
  root "public_recipes#index"
end

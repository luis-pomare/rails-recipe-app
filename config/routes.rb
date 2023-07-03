Rails.application.routes.draw do
  resources :recipes do
    member do
      get 'add_ingredient'
      get 'shopping_list'
    end
  end

  resources :foods
  devise_for :users
  resources :recipe_foods, only: [:create]
  
  get '/general_shopping_list', to: 'general_shopping_list#index'
  get '/public_recipes', to: 'public_recipes#index'
  root "public_recipes#index"
end

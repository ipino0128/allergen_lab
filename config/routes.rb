Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/search', to: 'recipes#search'
  resources :recipes, only: [:index, :new, :create, :show]
  resources :users, only: [:index, :show, :delete]
  resources :ingredients, only: [:index, :show]

end

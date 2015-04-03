Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch 'capture', to: 'pokemons#capture'
  post 'damage', to: 'pokemons#damage'
  get 'pokemons/new', to: 'pokemons#new'
  get "pokemons/:id", to: "pokemons#show"
  post "pokemons", to: "pokemons#create"
end

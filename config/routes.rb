Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'items/new', to: 'items#new'
  resources :items, only: [:index, :new, :create]
end

Ginga::Application.routes.draw do
  root 'welcomes#index'
  devise_for :users
  resources :welcomes, only: [:index]
  namespace :admin do
    resources :products
    resources :categories
    resources :welcomes, only: [:index]
  end
end

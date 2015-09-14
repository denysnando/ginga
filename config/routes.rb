Ginga::Application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products
    resources :categories
  end
end

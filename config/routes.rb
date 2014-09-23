Review::Application.routes.draw do
  root to: 'home#index'

  resources :posts
  resources :categories, only: [:index, :show]
end

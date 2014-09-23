Review::Application.routes.draw do
  root to: 'home#index'

  resources :reviews, :controller => "posts"
  resources :categories, only: [:index, :show]
end

Review::Application.routes.draw do
  root to: 'home#index'

  resources :reviews, :controller => "posts" do
    collection do
      resources :categories, only: [:show]
    end
    member do
      post 'user_review'
    end
    resources :comments, only: [:create]
  end
  resources :categories, only: [:index]
end

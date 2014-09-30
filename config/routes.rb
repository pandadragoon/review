Review::Application.routes.draw do
  root to: 'home#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

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
  resources :users, only: [:show, :create, :edit, :update]
end

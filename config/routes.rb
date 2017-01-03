Rails.application.routes.draw do
  root   'static_pages#home'
  #root   'movies#index'
  get   '/movies',   to: 'movies#index'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :movies do
    collection do
      get 'search'
    end
    
    resources :reviews do
      member do
        put "like", to: "reviews#upvote"
        put "dislike", to: "reviews#downvote"
      end
    end
    
    
    
    
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :reviews,          only: [:create, :destroy] 
  resources :relationships,       only: [:create, :destroy]
end
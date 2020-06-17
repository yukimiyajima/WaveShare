Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }

  resources :users, only: [:show, :index] do
    get 'likes', to: 'likes#index'
  end

  resources :topics do
    get 'like_users', to: 'likes#users'
  end

  root 'topics#home'
end

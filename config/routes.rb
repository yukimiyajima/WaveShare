Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  get 'users/topic_show'

  resources :topics
  get 'home', to: 'topics#home'
  root 'topics#home'
end

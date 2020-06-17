Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  get 'users/topic_show'

  resources :topics
  get 'home', to: 'topics#home'
  root 'topics#home'
end

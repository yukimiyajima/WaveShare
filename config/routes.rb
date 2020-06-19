Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }

  resources :users, only: [:show, :index] do
    get 'likes', to: 'likes#index'
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :topics do
    get 'like_users', to: 'likes#users'
    resources :comments
  end

  root 'topics#home'
end

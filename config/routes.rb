Rails.application.routes.draw do
  devise_for :users
  resources :topics
  get 'home', to: 'topics#home'
  root 'topics#home'
end

Rails.application.routes.draw do
  resources :topics
  get 'home', to: 'topics#home'
  root 'topics#home'
end

Rails.application.routes.draw do
  root to: 'home#index'
  resources :home, only: :index
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: :tag
end

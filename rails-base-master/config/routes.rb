Rails.application.routes.draw do
  root to: 'home#index'
  resources :home, only: :index
  resources :tags, only: :index
  resources :posts, only: [:index, :show, :new, :create]
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'tags/', to: 'tags#index'
end

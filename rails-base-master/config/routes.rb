Rails.application.routes.draw do
  root to: 'home#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "sessions/create"
  get "sessions/destroy"
  resources :users, only: [:new, :create]
  resources :comments, only: [:new, :create, :show]
  resources :home, only: :index
  resources :tags, only: :index
  resources :posts, only: [:index, :show, :new, :create]
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'tags/', to: 'tags#index'
end

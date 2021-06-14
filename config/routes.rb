Rails.application.routes.draw do
  get 'users/index'
  get 'posts/index'
  get 'posts/list'
  get 'posts/new'
  post 'posts/show'
  post 'posts/create'
  root 'home#index'
  get 'auths/login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'articles/index'
  resources :articles
  resources :posts
end

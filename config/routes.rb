Rails.application.routes.draw do
  get 'users/list'
  get 'users/new'
  get 'users/delete'
  post 'users/create'
  get 'posts/index'
  get 'posts/list'
  get 'posts/new'
  post 'posts/show'
  get 'posts/upload'
  post 'posts/create'
  get 'posts/edit'
  post 'posts/update'
  get 'posts/delete'
  root 'auths#login'
  get 'auths/login'
  get 'auths/logout'
  post 'auths/authenticate'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'articles/index'
  resources :articles
  resources :posts
end

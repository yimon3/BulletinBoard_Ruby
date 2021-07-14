Rails.application.routes.draw do
  get 'users/list'
  get 'users/new'
  get 'users/delete'
  post 'users/create'
  get 'users/confirm'
  post 'users/confirm'
  get 'users/showProfile'
  get 'users/editProfile'
  post 'users/search'
  get 'posts/list'
  get 'posts/new'
  get 'posts/upload'
  get 'posts/export'
  post 'posts/create'
  get 'posts/edit'
  post 'posts/update'
  get 'posts/confirm'
  post 'posts/confirm'
  get 'posts/delete'
  post 'posts/import'
  post 'posts/search'
  root 'auths#login'
  get 'auths/login'
  get 'auths/logout'
  post 'auths/authenticate'
  get 'auths/changePsw'
  post 'auths/updatePsw'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts

end

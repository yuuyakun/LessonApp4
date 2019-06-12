Rails.application.routes.draw do
  get  '/' => 'cover#top'
  get  '/about' => 'cover#about'

  get  'users/index' => 'users#index'
  get  'signup' => 'users#new'
  post 'users/create' => 'users#create'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get  'login' => 'users#login_form'

  get  'pages/index' => 'pages#index'
  get  'pages/new' => 'pages#new'
  post 'pages/create' => 'pages#create'

  get  'users/:id' => 'users#show'
  get  'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'

  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'

  get  'pages/:id/edit' => 'pages#edit'
  post 'pages/:id/update' => 'pages#update'
  get  'pages/:id' => 'pages#show'
  post 'pages/:id/destroy' => 'pages#destroy'






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

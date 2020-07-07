Rails.application.routes.draw do
  resources :comments
  # リソース名が複数
  
  # データを取得するget
  get 'topics/new'

  get 'sessions/new'
  
  # 一番初めのページはここ
  root 'pages#index'
  
  get 'pages/help'
  
  
  post 'comments', to: 'comments#create'
  
  
  

  resources :users

  get    '/login',   to: 'sessions#new'
  
  # 新たなデータを追加したい
  post   '/login',   to: 'sessions#create'
  
  delete '/logout',  to: 'sessions#destroy'
  
resources :topics  
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  delete 'favorites', to: 'favorites#destroy', as: 'destroy_favorite'
  
  
  
end
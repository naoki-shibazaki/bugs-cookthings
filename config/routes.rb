Rails.application.routes.draw do
  root to: 'sessions#new'
  # ログイン
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # ユーザ
  resources :users
  # レシピ
  resources :recipes
  get '/recipes/catalog/:date_param', to: 'recipes#catalog', as: 'catalog'
  post '/recipes/catalog/copy/:id', to: 'recipes#copy', as: 'copy'
end

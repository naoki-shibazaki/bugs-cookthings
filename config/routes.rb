Rails.application.routes.draw do

  root to: 'logins#index'
  get 'logins/index'
  resources :calenders
  devise_for :users
  delete  'params/:id'  => 'params#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do


  root   'static_pages#home'
  get    'static_pages/home'
  get    'vocabularies/show'
  get    'vocabularies/new'
  get    'sessions/new'
  get    '/signup',   to: 'users#new'
  post   '/signup',   to: 'users#create'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  get    '/new',      to: 'vocabularies#new'
  post   '/create',   to: 'vocabularies#create'
  get    '/show',     to: 'vocabularies#show'
  resources :users
  resources :vocabularies,         only: [:create, :show, :destroy]
end

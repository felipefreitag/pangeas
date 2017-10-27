Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: %i[show]
  resources :series, only: %i[show]
  resources :categories, only: %i[show]
  resources :sections, only: %i[index show]
  resources :subscriptions, only: %i[new]
  get '/cstqpangeas/', to: 'high_voltage/pages#show', id: 'landing_cstq'
  get '/cifsqpangeas/', to: 'high_voltage/pages#show', id: 'landing_cifsq'
  get '/svl/', to: 'high_voltage/pages#show', id: 'landing_svl'
end

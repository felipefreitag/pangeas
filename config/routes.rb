Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :videos, only: %i[index show]
  resources :series, only: %i[show]
  resources :categories, only: %i[show]
  resources :sections, only: %i[index show]
  resources :subscriptions, only: %i[new create show] do
    post :activate, on: :collection
  end
  resources :payments, only: %i[new]
  resources :users, only: %i[show]
  get '/cstqpangeas', to: 'high_voltage/pages#show', id: 'landing_cstq'
  get '/cifsqpangeas', to: 'high_voltage/pages#show', id: 'landing_cifsq'
  get '/svl', to: 'high_voltage/pages#show', id: 'landing_svl'
end

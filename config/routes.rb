Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: %i[show]
  resources :series, only: %i[show]
  resources :categories, only: %i[show]
  resources :sections, only: %i[index show]
end

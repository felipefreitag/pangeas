Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: %i[index show]
  root "videos#index"
end

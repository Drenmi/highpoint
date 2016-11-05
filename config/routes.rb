Rails.application.routes.draw do
  root "donations#index"
  resources :donations, only: [:create, :index, :update, :edit]
  resources :donors, only: [:index, :show, :update, :edit]
  resources :events, only: [:create, :index, :show, :update, :edit]
  resources :users, only: [:show]
end

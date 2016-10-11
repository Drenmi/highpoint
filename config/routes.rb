Rails.application.routes.draw do
  resources :donations, only: [:create, :update, :edit]
  resources :donors, only: [:show, :index, :update, :edit]
  resources :events, only: [:index, :create]
end

Rails.application.routes.draw do
  resources :donations, only: [:create, :update, :edit]
  resources :donors, only: [:index, :show, :update, :edit]
  resources :events, only: [:create, :index, :show]
end

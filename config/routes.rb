Rails.application.routes.draw do
  resources :donations, only: :create
  resources :donors, only: :show
end

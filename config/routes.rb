Rails.application.routes.draw do
  root "donations#index"
  resources :donations, only: [:create, :index, :update, :edit] do
    collection do
      resources :reports, only: [:create, :new, :index]
    end
  end
  resources :donors, only: [:index, :show, :update, :edit]
  resources :events, only: [:create, :index, :show, :update, :edit]
  resources :users, only: [:create, :show]
end

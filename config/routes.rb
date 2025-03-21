Rails.application.routes.draw do
  devise_for :users
  
  # Our root (home) page is the index action of DeliveriesController.
  root "deliveries#index"

  # We only need the :index, :create, :update, and :destroy actions on Deliveries.
  resources :deliveries, only: [:index, :create, :update, :destroy]
end

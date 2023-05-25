Rails.application.routes.draw do
  root 'transactions#index'
  resources :uploads, only: [:new, :create]
  resources :transactions, only: [:index]
end

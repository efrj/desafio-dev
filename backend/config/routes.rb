Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'transactions#index'
  resources :uploads, only: [:new, :create]
  resources :transactions, only: [:index]
end

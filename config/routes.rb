Rails.application.routes.draw do
  resources :events

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }

  root to: 'events#index'
end

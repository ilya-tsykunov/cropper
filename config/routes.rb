Rails.application.routes.draw do
  resources :events
  resources :event_filters, except: %i(index show)

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }

  root to: 'events#index'
end

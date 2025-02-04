Rails.application.routes.draw do
  get 'images/index'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
        confirmations: 'users/confirmations'
      }
  resources :images
  root to: 'images#index'
  get '/confirmation_pending' => 'images#after_registration_path'
end

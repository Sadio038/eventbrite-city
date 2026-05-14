Rails.application.routes.draw do
  root "events#index"
  devise_for :users

  # Namespace Admin
  namespace :admin do
    root "dashboard#index"
    resources :users
    resources :events
    resources :event_submissions, only: [:index, :show, :edit, :update]
  end

  resources :events do
    resources :attendances, only: [:new, :create, :index]
  end
  resources :users, only: [:show, :edit, :update], constraints: { id: /\d+/ }
end

Rails.application.routes.draw do
  root "events#index"
  devise_for :users
  resources :events do
    resources :attendances, only: [:new, :create, :index]
  end
  resources :users, only: [:show, :edit, :update], constraints: { id: /\d+/ }
end
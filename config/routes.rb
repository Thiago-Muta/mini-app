Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :tasks
    post 'change_status', to: 'tasks#change_status'

  get 'user_reports', to: 'reports#user_reports'
  get 'reports', to: 'reports#index'

  resources :profiles, only: %i[show new create update edit] do
    get 'private_page', on: :member
    post 'change_privacy', on: :member
    resources :comments, only: %i[index]
  end

  resources :pluses, only: %i[create destroy]
  resources :minuses, only: %i[create destroy]
end
